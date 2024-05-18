# Queue編

## Reference

[OCI Queue Service 概要](https://speakerdeck.com/oracle4engineer/oci-queue-service-gai-yao)

[OCI Queue Service 技術概要](https://speakerdeck.com/oracle4engineer/queue-tech-detail)

## OCI Consoleを用いてQueueにメッセージをPut/Get/Deleteできることを確認してください

[Queue作成方法](https://docs.oracle.com/en-us/iaas/Content/queue/queue-create.htm#top)

### Put

[キューへのメッセージの公開](https://docs.oracle.com/ja-jp/iaas/Content/queue/publish-messages-queue.htm)

[チャネルへのメッセージのパブリッシュ](https://docs.oracle.com/ja-jp/iaas/Content/queue/publish-messages-channel.htm)

### Get

[キュー詳細の取得](https://docs.oracle.com/ja-jp/iaas/Content/queue/queue-details.htm)

### Delete

[キューの削除](https://docs.oracle.com/ja-jp/iaas/Content/queue/queue-delete.htm)

## OCI CLIを用いてQueueにメッセージをPut/Get/Deleteできることを確認してください

これ以降の操作の環境変数設定。`C`はコンパートのOCID、`Q`はQueueのOCID、`E`はエンドポイントのURL

```console
[opc@bastion ~]$ echo $E
https://cell-1.queue.messaging.ap-tokyo-1.oci.oraclecloud.com
[opc@bastion ~]$ echo $C
ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
[opc@bastion ~]$ echo $Q
ocid1.queue.oc1.ap-tokyo-1.amaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### メッセージのフォーマットを確認

```console
oci queue messages put-messages --generate-param-json-input messages > messages.json
```

`messages.json`の中身

```json
[
  {
    "content": "string",
    "metadata": {
      "channelId": "string",
      "customProperties": {
        "string1": "string",
        "string2": "string"
      }
    }
  },
  {
    "content": "string",
    "metadata": {
      "channelId": "string",
      "customProperties": {
        "string1": "string",
        "string2": "string"
      }
    }
  }
]
```

### サンプルメッセージを作成

[messages.json](./messages.json)

```json
[
  {
    "content": "string",
    "metadata": {
      "channelId": "channel01",
      "customProperties": {
        "string1": "channel01-string01",
        "string2": "channel01-string02"
      }
    }
  },
  {
    "content": "string",
    "metadata": {
      "channelId": "channel02",
      "customProperties": {
        "string1": "channel02-string01",
        "string2": "channel02-string02"
      }
    }
  }
]
```

### Put

```console
[opc@bastion ~]$ oci queue messages put-messages --queue-id $Q --messages file://messages.json --endpoint $E
{
  "data": {
    "messages": [
      {
        "expire-after": "2024-05-18T22:00:53.249000+00:00",
        "id": 90071992627959052
      },
      {
        "expire-after": "2024-05-18T22:00:53.249000+00:00",
        "id": 90071992627959053
      }
    ]
  }
}
```

### Get

```console
[opc@bastion ~]$ oci queue messages get-messages --queue-id $Q --endpoint $E --channel-filter channel01
{
  "data": {
    "messages": [
      {
        "content": "string",
        "delivery-count": 3,
        "expire-after": "2024-05-18T22:00:53.249000+00:00",
        "id": 90071992627959052,
        "metadata": {
          "channel-id": "channel01",
          "custom-properties": {
            "string1": "channel01-string01",
            "string2": "channel01-string02"
          }
        },
        "receipt": "AUOgrjI4FH_rAHQE1dyHZj3CcX4GAGZssMN0nVostB9VQ5xuHp9CMKEv6eftD2UlUlY6XwZ1SQ15e5ka3Qchsr9ifIeZFouUHJJ1j_t_ghW81OpwD9WaBp2rHT8Fu47ThmCDbNXc8B6BsfWeQsEyyMGfhxaTHcweuU2tfy00R5XH8Vd155blvdw4X4kbDoUL5nZZmnfPqH7Vv0Awp8iQwYtJGSMJ5ItK7lq-L8d-pnTCa3GERAVg_CpVOlPj2yU0yZJeFJQzz1CslYFBGF7v5fRWXX4z0h0r71gHWRscExDsvLVKH0TatxXkic-97NnmqVdZtEI6enXFAaCHhEsSQxfQrrdqgHKPToM-Xc9Tcp5BKg",
        "visible-after": "2024-05-17T22:08:42.853000+00:00"
      }
    ]
  }
}
[opc@bastion ~]$ 
[opc@bastion ~]$ oci queue messages get-messages --queue-id $Q --endpoint $E --channel-filter channel02
{
  "data": {
    "messages": [
      {
        "content": "string",
        "delivery-count": 2,
        "expire-after": "2024-05-18T22:00:53.249000+00:00",
        "id": 90071992627959053,
        "metadata": {
          "channel-id": "channel02",
          "custom-properties": {
            "string1": "channel02-string01",
            "string2": "channel02-string02"
          }
        },
        "receipt": "Aced2v-Tr9SAAKfmJFBjQKsfEwf7TYxUu5GFlx7K62Ok24qHfS8NSJCU5215CVGICZZerni1Pn_tg4y_LUEG6okyOLJqpBXr5zdX7DWnpTojiyfKM0UXQlgnbUORz5qLDJV30gfUU9XgZgffZdCdcv3McjHghl46RFfJTPiBEGftXSPPIFrtVMjezJsQCDmOcMSMNr6jSCWJ4iDS42j3YsNCR-OvatneBF4xghUnI2TwHa5LIigdVv1dAkXjiKoIGaRym8uP8v79qnkF6zebxp7pFlcFNAUzZ3zn6u_EMpgGXGNffHZYhXr_3AkcS1YaEkhZ8O1Ynh61Bd8QSALgPt09lNJJfTBZx28dSVCxn67uBA",
        "visible-after": "2024-05-17T22:09:05.137000+00:00"
      }
    ]
  }
}
[opc@bastion ~]$ 
```

Maximum delivery attemptsを3、Visibility timeoutを15秒、Polling timeoutを30秒にした場合のGetの結果

```console
[opc@bastion ~]$ for i in {1..5}; do  time oci queue messages get-messages --queue-id $Q --endpoint $E --channel-filter channel01; done
{
  "data": {
    "messages": [
      {
        "content": "string",
        "delivery-count": 1,
        "expire-after": "2024-05-18T22:26:00.926000+00:00",
        "id": 90071992627963317,
        "metadata": {
          "channel-id": "channel01",
          "custom-properties": {
            "string1": "channel01-string01",
            "string2": "channel01-string02"
          }
        },
        "receipt": "AUVTRFMIrP_dAJsJF1nXhW6qg3hE_4Asww9dWHDoWdlCuTQMppy4FEGPeaC9d1J1DXQZGbZ_BoBGoc7TVs8i2FSQa3y-bMdri-2jzL1GnpaEaHnlaxpuMdFOfrr9-Ja1LnHppGsnvf_gXuIkqoLcn2B0ban55Wo1ykWs8cB-f1XyY7Bb_Id-YwZgF6HSb3cMzHUFzmXTfiPKvKvxQ4yR5zVEsn7J-zkZ0RKEUQRn83TkC_PLQbtMrUx2FQ4b_CMIY7rS97kfw93dYiAo5hSAv7H_G62Rpw68eAf2jG_YAT-OlxmTc0xtYhoYR7M8iHzR-cC439TYi8TzxuT5i_Ql5iWHNiOeBHk9QuB--LdhVabY9w",
        "visible-after": "2024-05-17T22:26:22.878000+00:00"
      }
    ]
  }
}

real    0m4.426s
user    0m3.610s
sys     0m0.461s
{
  "data": {
    "messages": [
      {
        "content": "string",
        "delivery-count": 2,
        "expire-after": "2024-05-18T22:26:00.926000+00:00",
        "id": 90071992627963317,
        "metadata": {
          "channel-id": "channel01",
          "custom-properties": {
            "string1": "channel01-string01",
            "string2": "channel01-string02"
          }
        },
        "receipt": "Aced2v-Tr9SAAKhEYpSprSXMshs83mG5kvdMuaTS7ciefCSfw3s3Q9gK5O8HruDOGnpcBQpmhzupkveucKAGtvw6LvL0IeoBG_1H1tId3cIDaO-Lvuhh-Q1GHUpvXfQtRRWSzE5jiOyIRK6MepBNNxOcuh7l1UacHHBA6DinI7RZXz3yvgDUj_rQ5oG3AMLZzbS7SPIzgTgOxDN7O0sNudeljHZ6RFYa-A2f8-sxJmj_9R7xeA9j9myJOyE1J1bYiR01ij4RRAEg_knVK5nhr8AVIVz1d3bUbvYOt0EJbouB8LVFnVBtikLOqFAuN8h0s_sW8ErECMhdvfQgcNCuzlmgkC8CmWI9cyuRjLIfX4yhEQ",
        "visible-after": "2024-05-17T22:26:38.079000+00:00"
      }
    ]
  }
}

real    0m15.021s
user    0m3.539s
sys     0m0.499s
{
  "data": {
    "messages": [
      {
        "content": "string",
        "delivery-count": 3,
        "expire-after": "2024-05-18T22:26:00.926000+00:00",
        "id": 90071992627963317,
        "metadata": {
          "channel-id": "channel01",
          "custom-properties": {
            "string1": "channel01-string01",
            "string2": "channel01-string02"
          }
        },
        "receipt": "AUOgrjI4FH_rAHQJ06cNeaz0sqhU5-IbgR9AIcYImIjVJ1Cjgca2qF77SIwX5kjmjGZHtzRqeGaUnNr8anNT4FH6jNWFY_aZ-bjmPeJSKRhiozRP6ZoFsjUVniB_CjurgDZPrStwJ2mxRO2hY8ph6SzHGhxR2DG7hAE13MThD0Stxv9SCMWmi4yof1dK9fI8-dPuhNSk0tsQ2yVcBrsg2qND74E93pax5wvAcfncB9lKHvbyVZQQYjyV4v7lHD04zQ7B6CYL4fDOV1UarwJ106AMlg9yekNpm0L3yFpCYrn-a5OAo19m6NZEFpKnQqcaEql9l08I0oBGyrwtnUatGv6vMiDnzJQsKo3oMLxpPtVKIg",
        "visible-after": "2024-05-17T22:26:53.698000+00:00"
      }
    ]
  }
}

real    0m15.689s
user    0m3.561s
sys     0m0.452s
{
  "data": {
    "messages": []
  }
}

real    0m34.289s
user    0m3.572s
sys     0m0.500s
{
  "data": {
    "messages": []
  }
}

real    0m34.241s
user    0m3.613s
sys     0m0.460s
[opc@bastion ~]$ 
```

3回まで15秒ごとにメッセージを取得して、4回目以降は約30秒でタイムアウトしている。

### Delete

削除用の[entries.json](./entries.json)ファイル作成

```json
[
  {
    "receipt": "AUVTRFMIrP_dAKTQ3ZIsK2Y8wmrlpfNfXMdbZ5wWKwOTm_OXe9BCmdkpWCch59DUzDCcveSTJHRJ60jeD3qBC4aCYMGVrAwmB7mhFAmvJao7tGhLpv7WlLued1wgMrj9M42zkyZ4ij2HDIZZujoMopPTACFmofEiMfhg0-gzqlehBGIGmSVgeJuR25-MSorvGB0gY_R8sz4smpOdb7M3lF23vtsLPvzb6Efzgu9Yp9eDOaTwdsBRPWk9wg1krF6Sm5IbApZjTehpG5-VMUr-ApMqDWgbgLbCdilpadi5ZAsKZROMhr8xbsPfRCBaUBBrcyWEroBtsmFk74Je2WTYOrIDPIeNwQRdJfG8GTJF_V9NXg"
  },
  {
    "receipt": "Aced2v-Tr9SAAK9CXCqVHGH_xec72m6ZfyytOJTZqo_w2spzIM--he9wE9Gs2fbasCyN396mBxS57Kwh8fVp_g8qlF81xUnY9fmc2qygpKbp-LpNcG3w7s-6br8uSGxsIMlDPWKh7W7VoCuOp3DwBBeoOMMXfuCKPH4-cFSGDEbEbMR_4kSHI2liVLpr66QNZM3rcpQQRwA_gqJuPV3h9QkzrGwY7ArjmEwtNL4PeWBCsOzibUeghf_PIUGmHyGLDQ2aAnJFh-cZfeeUhSjYzesXJLxOUX8qT7DnMTwCTzMeqQnhXToAqclEYMpSxW0ySN-7JA5rwdMjmnSmSC6SAqqxNdouF2RpJYARgaaqO64Qsg"
  },
  {
    "receipt": "Aced2v-Tr9SAAK9CkNviH0UEv41v9EQ5DOEzuF_sj3Pul1l7NIvmQBEkuT4qQAbM5JmTAk3Sc9BVosYemkAVaomVZm8G7N-BS_rghjsoWZvrQKDZD8DXAc3xmKj3Aig6pb5IA-sb4OY9wWatgWxswHKjL8OqfBf86Hh4QEJ5lev6KrudeM7phh25vRePckRFiOOY5RW2wre6xaMM4EMuggt6WGV2NEsRs5O0BWZGlzp2yFgFv1ib-WqB0wLHEhwFw3m2X7lDdAArpUm5indicP8P0gRFLCxK_Rph-jEkKExBBNWr-WcCvT6FnU9VvGY8LJs93NCpj1sZ-Rkmzy_VwioW-c-of29A-0T83oapAFVHsg"
  }
]

```

```console
[opc@bastion ~]$ oci queue messages delete-messages --entries file://entries.json --queue-id $Q --endpoint $E
{
  "data": {
    "client-failures": 0,
    "entries": [
      {
        "error-code": null,
        "error-message": null
      },
      {
        "error-code": null,
        "error-message": null
      },
      {
        "error-code": null,
        "error-message": null
      }
    ],
    "server-failures": 0
  }
}
[opc@bastion ~]$ 
```

## 任意の言語 + SDKを用いてQueueにメッセージをPut/Get/Deleteするコードを書いてください(Python)

### Put

[message-put.py](./message-put.py)

```python
import oci
import os

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()


# Initialize service client with default config file
queue_client = oci.queue.QueueClient(config, service_endpoint=os.environ['E'])


# Send the request to service, some parameters are not required, see API
# doc for more info
put_messages_response = queue_client.put_messages(
    queue_id=os.environ['Q'],
    put_messages_details=oci.queue.models.PutMessagesDetails(
        messages=[
            oci.queue.models.PutMessagesDetailsEntry(
                content="content-Value",
                metadata=oci.queue.models.MessageMetadata(
                    channel_id="channel09",
                    custom_properties={"string1": "HELLO"}
                    )
                )
            ]
        ),
    opc_request_id="")

# Get the data from response
print(put_messages_response.data)
```

```console
[opc@bastion ~]$ python3 message-put.py 
{
  "messages": [
    {
      "expire_after": "2024-05-19T08:33:11.891000+00:00",
      "id": 90071992628062758
    }
  ]
}
```

### Get

[message-get.py](./message-get.py)

```python
import oci
import os

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()


# Initialize service client with default config file
queue_client = oci.queue.QueueClient(config, service_endpoint=os.environ['E'])


# Send the request to service, some parameters are not required, see API
# doc for more info
get_messages_response = queue_client.get_messages(
    queue_id=os.environ['Q'],
    visibility_in_seconds=10,
    timeout_in_seconds=10,
    limit=2,
    opc_request_id="",
    channel_filter="channel09")

# Get the data from response
print(get_messages_response.data)
```

```console
[opc@bastion ~]$ python3 message-get.py 
{
  "messages": [
    {
      "content": "content-Value",
      "delivery_count": 1,
      "expire_after": "2024-05-19T08:36:37.267000+00:00",
      "id": 90071992628063267,
      "metadata": {
        "channel_id": "channel09",
        "custom_properties": {
          "string1": "HELLO"
        }
      },
      "receipt": "Aced2v-Tr9SAAK9NsxO-eT3YdmhHPRxriglHIiI-oWUbojzwWuU6Fv_lYodevEjsAyMtXsDtOpD2lrdsKdeOxjZYwicZiIZZpURMFYrEjwea59OHJaQjGbo9YIKJcbowMLYMv_ONpuZ4XpYmevmAaFRuXOMNWU_9KbWu9wx5uTNdoAzKZYgHTB3-NfVS25jh4IVjC7FCt_JXYcTl6z5-gCiF8vdMiBp6ZAcfV1bRDMjdd1v7dOwRCxfQYFqtjqQjNwbOrYywnumQoxk9FFC42jRZ1F-l--tDZbPrwSiKipFX4mV_74y5XNaGH2CMQpbB9QPSBWHEifhY5y9HtvW3tGWJSYRiLL_i6JWunQlyGe9qOw",
      "visible_after": "2024-05-18T08:36:52.545000+00:00"
    }
  ]
}
```

### Delete

[message-delete.py](./message-delete.py)

```python
import oci
import os
# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()

# Initialize service client with default config file
queue_client = oci.queue.QueueClient(config, service_endpoint=os.environ['E'])

# Send the request to service, some parameters are not required, see API
# doc for more info
delete_message_response = queue_client.delete_message(
    queue_id=os.environ['Q'],
    message_receipt="Aced2v-Tr9SAAK9NsxO-eT3YdmhHPRxriglHIiI-oWUbojzwWuU6Fv_lYodevEjsAyMtXsDtOpD2lrdsKdeOxjZYwicZiIZZpURMFYrEjwea59OHJaQjGbo9YIKJcbowMLYMv_ONpuZ4XpYmevmAaFRuXOMNWU_9KbWu9wx5uTNdoAzKZYgHTB3-NfVS25jh4IVjC7FCt_JXYcTl6z5-gCiF8vdMiBp6ZAcfV1bRDMjdd1v7dOwRCxfQYFqtjqQjNwbOrYywnumQoxk9FFC42jRZ1F-l--tDZbPrwSiKipFX4mV_74y5XNaGH2CMQpbB9QPSBWHEifhY5y9HtvW3tGWJSYRiLL_i6JWunQlyGe9qOw",
    opc_request_id="")

# Get the data from response
print(delete_message_response.headers)
```

```console
[opc@bastion ~]$ python3 message-delete.py 
{'opc-request-id': '/A5FB905877787947806DD1444756AFF3/1B1DF3C64799BA7627A0974F392A8E9B', 'access-control-allow-origin': '*', 'access-control-allow-methods': 'POST,PUT,GET,HEAD,DELETE,OPTIONS', 'access-control-allow-credentials': 'true', 'access-control-expose-headers': 'access-control-allow-credentials,access-control-allow-methods,access-control-allow-origin,content-length,opc-client-info,opc-request-id'}
```

## (参考)JSON format
https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliusing.htm#AdvancedJSON
