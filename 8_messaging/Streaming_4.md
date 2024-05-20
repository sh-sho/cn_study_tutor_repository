# 任意の言語 + SDKを用いてStreamingとPub/Subするコードを書いてください

任意の言語はpythonにしました。<br>
基本流れはCLIと同じで
1. メッセージのPut
2. カーソルの作成
3. メッセージのGet<br>

## Put
参考：[PutMessagesのAPIリファレンス](https://docs.oracle.com/en-us/iaas/api/#/en/streaming/20180418/Message/PutMessages)

[put.py](https://github.com/sh-sho/cn_study_tutor_repository/blob/8_Streaming_tokunaga/8_messaging/8_stream/put.py)
```
import oci

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()


# Initialize service client with default config file
streaming_client = oci.streaming.StreamClient(
    config, "https://cell-1.streaming.us-ashburn-1.oci.oraclecloud.com")


# Send the request to service, some parameters are not required, see API
# doc for more info
put_messages_response = streaming_client.put_messages(
    stream_id="ocid1.stream.oc1.iad.amaaaaaassxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    put_messages_details=oci.streaming.models.PutMessagesDetails(
        messages=[
            oci.streaming.models.PutMessagesDetailsEntry(
                value="YmFuYW5h",
                key="a2V5Mg==")])
    )

# Get the data from response
print(put_messages_response.data)
```


実行結果
```
ubuntu@public-instance-tokunaga-ubuntu2:~/8_stream$ python3 put.py 
{
  "entries": [
    {
      "error": null,
      "error_message": null,
      "offset": 27,
      "partition": "0",
      "timestamp": "2024-05-20T00:41:34.427000+00:00"
    }
  ],
  "failures": 0
}

```
## CreateCursor
参考：[CreateCursorのAPIリファレンス](https://docs.oracle.com/en-us/iaas/api/#/en/streaming/20180418/Cursor/CreateCursor)

[CreateCursor.py](https://github.com/sh-sho/cn_study_tutor_repository/blob/8_Streaming_tokunaga/8_messaging/8_stream/CreateCursor.py)
```
from datetime import datetime
import oci

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()


# Initialize service client with default config file
streaming_client = oci.streaming.StreamClient(
    config, "https://cell-1.streaming.us-ashburn-1.oci.oraclecloud.com")


# Send the request to service, some parameters are not required, see API
# doc for more info
create_cursor_response = streaming_client.create_cursor(
    stream_id="ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yxxxxxxxxxxxxxxxxxxxxxxxxx",
    create_cursor_details=oci.streaming.models.CreateCursorDetails(
        partition="0",
        type="TRIM_HORIZON"
    )
)

# Get the data from response
print(create_cursor_response.data)
```
実行結果
```
ubuntu@public-instance-tokunaga-ubuntu2:~/8_stream$ python3 CreateCursor.py 
{
  "value": "eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IlRyaW1Ib3Jpem9uIiwib2Zmc2V0IjpudWxsLCJ0aW1lIjpudWxsLCJwYXJ0aXRpb24iOiIwIiwic3RyZWFtSWQiOiJvY2lkMS5zdHJlYW0ub2MxLmlhZC5hbWFhYWFhYXNzbDY1aXFhbWszeW9vaXluMmtiNjc0cXhqMnlvMmR1bnd3czNsN3FldXozZ2dnNzdpNnEiLCJleHBpcmF0aW9uIjoxNzE2MTY2NzgzMzEzLCJjdXJzb3JUeXBlIjoicGFydGl0aW9uIn0="
}
```

## Get
参考：[GetMessagesのAPIリファレンス](https://docs.oracle.com/en-us/iaas/api/#/en/streaming/20180418/Message/GetMessages)

[get.py](https://github.com/sh-sho/cn_study_tutor_repository/blob/8_Streaming_tokunaga/8_messaging/8_stream/get.py)
cursorの値は、CreateCursorの返り値を入れる
```
import oci

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()


# Initialize service client with default config file
streaming_client = oci.streaming.StreamClient(
    config, "https://cell-1.streaming.us-ashburn-1.oci.oraclecloud.com")


# Send the request to service, some parameters are not required, see API
# doc for more info
get_messages_response = streaming_client.get_messages(
    stream_id="ocid1.stream.oc1.iad.amaaaaaassl65iqamkxxxxxxxxxxxxxxxxxxxxxx",
    cursor="eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IlRyaW1Ib3Jpem9uIiwib2Zmc2V0IjpudWxsLCJ0aW1lIjpudWxsLCJwYXJ0aXRpb24iOiIwIiwic3RyZWFtSWQiOiJvY2lkMS5zdHJlYW0ub2MxLmlhZC5hbWFhYWFhYXNzbDY1aXFhbWszeW9vaXluMmtiNjc0cXhqMnlvMmR1bnd3czNsN3FldXozZ2dnNzdpNnEiLCJleHBpcmF0aW9uIjoxNzE2MTY2NzgzMzEzLCJjdXJzb3JUeXBlIjoicGFydGl0aW9uIn0=",
    limit=8824
    )

# Get the data from response
print(get_messages_response.data)

```

実行結果
```
ubuntu@public-instance-tokunaga-ubuntu2:~/8_stream$ python3 get.py 
[{
  "key": "a2V5Mg==",
  "offset": 27,
  "partition": "0",
  "stream": "cn_study_stream",
  "timestamp": "2024-05-20T00:41:34.427000+00:00",
  "value": "YmFuYW5h"
}]
```
