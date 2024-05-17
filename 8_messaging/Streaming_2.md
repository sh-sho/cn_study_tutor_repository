# OCI CLIを用いてStreamingにメッセージをPublish/Subscribeできることを確認してください

## Publish

参考：[ストリームへのテスト・メッセージの公開](https://docs.oracle.com/ja-jp/iaas/Content/Streaming/Tasks/publishingmessages.htm)<br>
key、valueは、Base64 エンコードする必要があるため、変更したい場合は、適当な[エンコーダー](https://www.en-pc.jp/tech/base64.php)を使う
ちなみに私はkey1:appleという文字をエンコードしてます。

`oci -i`の時endpointオプションを入れると赤字メッセージはでるが、そのまま実行する。<br>
逆にendpointオプションを入れないと、endpointが無いというerrorが出て実行できない
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci -i
> oci streaming stream message put --stream-id ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yooiyn2kb674qxj2yo2dunwws3l7qeuz3ggg77i6q --messages  '[{"key": "a2V5MQ0K", "value": "YXBwbGUNCg=="}]' --endpoint https://cell-1.streaming.us-ashbu
rn-1.oci.oraclecloud.com                                                                                                                                                                                                                  
{
  "data": {
    "entries": [
      {
        "error": null,
        "error-message": null,
        "offset": 26,
        "partition": "0",
        "timestamp": "2024-05-17T10:45:17.782000+00:00"
      }
    ],
    "failures": 0
  }
}
ritsuko_to@cloudshell:~ (us-ashburn-1)$ 

```
## カーソルの作成
参考：[カーソルの使用](https://docs.oracle.com/ja-jp/iaas/Content/Streaming/Tasks/using_a_single_consumer.htm#usingcursors)
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ oci -i
> oci streaming stream cursor create-cursor --partition 0 --type TRIM_HORIZON --stream-id ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yooiyn2kb674qxj2yo2dunwws3l7qeuz3ggg77i6q --endpoint https://cell-1.streaming.us-ashburn-1.oci.oracleclo
ud.com                                                                                                                                                                                                                                    
{
  "data": {
    "value": "eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IlRyaW1Ib3Jpem9uIiwib2Zmc2V0IjpudWxsLCJ0aW1lIjpudWxsLCJwYXJ0aXRpb24iOiIwIiwic3RyZWFtSWQiOiJvY2lkMS5zdHJlYW0ub2MxLmlhZC5hbWFhYWFhYXNzbDY1aXFhbWszeW9vaXluMmtiNjc0cXhqMnlvMmR1bnd3czNsN3FldXozZ2dnNzdpNnEiLCJleHBpcmF0aW9uIjoxNzE1OTQzMTYwNTI2LCJjdXJzb3JUeXBlIjoicGFydGl0aW9uIn0="
  }
}

```
## Subscribe
参考：[ストリームへのテスト・メッセージの公開](https://docs.oracle.com/ja-jp/iaas/Content/Streaming/Tasks/consumingmessages.htm)
```
> oci streaming stream message get --cursor eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IlRyaW1Ib3Jpem9uIiwib2Zmc2V0IjpudWxsLCJ0aW1lIjpudWxsLCJwYXJ0aXRpb24iOiIwIiwic3RyZWFtSWQiOiJvY2lkMS5zdHJlYW0ub2MxLmlhZC5hbWFhYWFhYXNzbDY1aXFhbWszeW
9vaXluMmtiNjc0cXhqMnlvMmR1bnd3czNsN3FldXozZ2dnNzdpNnEiLCJleHBpcmF0aW9uIjoxNzE1OTQzMTYwNTI2LCJjdXJzb3JUeXBlIjoicGFydGl0aW9uIn0= --stream-id ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yooiyn2kb674qxj2yo2dunwws3l7qeuz3ggg77i6q --endpoint ht
tps://cell-1.streaming.us-ashburn-1.oci.oraclecloud.com                                                                                                                                                                                   
{
  "data": [
    {
      "key": null,
      "offset": 24,
      "partition": "0",
      "stream": "cn_study_stream",
      "timestamp": "2024-05-17T08:58:24.997000+00:00",
      "value": "dGVzdA=="
    },
    {
      "key": null,
      "offset": 25,
      "partition": "0",
      "stream": "cn_study_stream",
      "timestamp": "2024-05-17T10:30:51.746000+00:00",
      "value": "dGVzdDE="
    },
    {
      "key": "a2V5MQ0K",
      "offset": 26,
      "partition": "0",
      "stream": "cn_study_stream",
      "timestamp": "2024-05-17T10:45:17.782000+00:00",
      "value": "YXBwbGUNCg=="
    }
  ],
  "opc-next-cursor": "eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IkFmdGVyT2Zmc2V0Iiwib2Zmc2V0IjoyNiwidGltZSI6bnVsbCwicGFydGl0aW9uIjoiMCIsInN0cmVhbUlkIjoib2NpZDEuc3RyZWFtLm9jMS5pYWQuYW1hYWFhYWFzc2w2NWlxYW1rM3lvb2l5bjJrYjY3NHF4ajJ5bzJkdW53d3MzbDdxZXV6M2dnZzc3aTZxIiwiZXhwaXJhdGlvbiI6MTcxNTk0MzIyMTQ5NywiY3Vyc29yVHlwZSI6InBhcnRpdGlvbiJ9"
}
ritsuko_to@cloudshell:~ (us-ashburn-1)$ 

```
