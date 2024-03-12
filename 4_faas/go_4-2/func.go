package main

import (
	"context"
	"encoding/json"
	"encoding/csv"
	"io"
	"fmt"
	"bytes"
	"strings"
	
	fdk "github.com/fnproject/fdk-go"
	"github.com/oracle/oci-go-sdk/v65/common/auth"
	"github.com/oracle/oci-go-sdk/v65/objectstorage"
)

func main() {
	fdk.Handle(fdk.HandlerFunc(copyObjectStorage))
}

func copyObjectStorage(ctx context.Context, in io.Reader, out io.Writer) {
	var err error

	configurationProvider, err := auth.ResourcePrincipalConfigurationProvider()
	if err != nil {
		panic(err)
	}

	client, err := objectstorage.NewObjectStorageClientWithConfigurationProvider(configurationProvider)
	fmt.Println("Clinet is ", client)
	if err != nil {
		fmt.Println("ObjectStorageクライアント作成失敗: ", err)
	}

	namespace, err := getNamespace(ctx, client)
	fmt.Printf("取得したネームスペースは: %s", namespace)
	src_bucketname := "SRC_BUCKET"
	dst_bucketname := "DST_BUCKET"

    // アップロードされたファイル名を取得
	var event map[string]interface{}
	json.NewDecoder(in).Decode(&event)
	upload_data := event["data"].(map[string]interface{})
	objectname := upload_data["resourceName"].(string)

	// ファイルのオブジェクトの取得
	var contentRead []byte
	contentRead, err = getObject(ctx, client, namespace, src_bucketname, objectname)
	if err != nil {
		fmt.Printf("failed to get object %s from OCI Object storage : %s", objectname, err)
	}

	// CSV → JSON変換
	csv_reader := csv.NewReader(strings.NewReader(string(contentRead)))
	csv_records, err := csv_reader.ReadAll()
	if err != nil {
		fmt.Printf("CSVの読み込みエラー: ,%s", err)
	}
	headers := csv_records[0]

	var data []map[string]interface{}
	for _, record := range csv_records[1:]{
		rowData := make(map[string]interface{})
		for i, value := range record {
			if i < len(headers) {
				rowData[headers[i]] = value
			}
		}
		data = append(data, rowData)
	}
	jsonData, err := json.Marshal(data)
	if err != nil {
		fmt.Printf("JSON変換エラー: %s", err)
	}
	contentReader := bytes.NewReader(jsonData)
	contentReaderCloser := io.NopCloser(contentReader)
	contentlen := int64(len(jsonData))

	// オブジェクトのアップロード
	var dst_objectname string
	dst_objectname = objectname + ".json"
	err = putObject(ctx, client, namespace, dst_bucketname, dst_objectname, contentlen, contentReaderCloser)
	if err != nil {
		fmt.Printf("オブジェクトのアップロードに失敗: %s", err)
	} else {
		fmt.Println("オブジェクトのアップロードに成功")
	}

}

func getNamespace(ctx context.Context, client objectstorage.ObjectStorageClient) (string, error) {
	request := objectstorage.GetNamespaceRequest{}
	response, err := client.GetNamespace(ctx, request)
	if err != nil {
		return *response.Value, fmt.Errorf("ネームスペース取得に失敗しました: %w", err)
	}
	return *response.Value, nil
}

func putObject(ctx context.Context, c objectstorage.ObjectStorageClient, namespace, bucketname, objectname string, contentLen int64, content io.ReadCloser) error {
	request := objectstorage.PutObjectRequest{
		NamespaceName: &namespace,
		BucketName:    &bucketname,
		ObjectName:    &objectname,
		ContentLength: &contentLen,
		PutObjectBody: content,
	}
	_, err := c.PutObject(ctx, request)
	return err
}

func getObject(ctx context.Context, client objectstorage.ObjectStorageClient, namespace string, bucketName string, objectname string) (content []byte, err error) {
	request := objectstorage.GetObjectRequest{
		NamespaceName: &namespace,
		BucketName:    &bucketName,
		ObjectName:    &objectname,
	}
	var response objectstorage.GetObjectResponse

	response, err = client.GetObject(ctx, request)
	if err != nil {
		fmt.Printf("オブジェクトの取得に失敗: %w", err)
	}
	defer response.Content.Close()

	content, err = io.ReadAll(response.Content)
	if err != nil {
		fmt.Printf("コンテンツの読み込みに失敗: %w", err)
	}
	return content,nil
}
