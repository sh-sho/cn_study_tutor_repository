# Logging編

## OCI FunctionsのログをOCI Loggingから参照できるようにしてください
OCI FunctionsのLogを有効化する。

![alt text](./images/01_log.png)

適当なfunctionsを起動させる。
```python
$ fn invoke cn_func cn_helloworld_func
{"message": "Hello World"}
```

Logが取れる。
![alt text](./images/02_log.png)

```log
{
  "datetime": 1717554913013,
  "logContent": {
    "data": {
      "applicationId": "ocid1.fnapp.oc1.phx.aaaaaaaaxxxxxxxx",
      "containerId": "01HZK402MQ00000000000002VD",
      "functionId": "ocid1.fnfunc.oc1.phx.aaaaaaaaxxxxxxxx",
      "message": "01HZK3ZJXS1BT0D20ZJ00E73MM - root - INFO - Inside Python Hello World function",
      "opcRequestId": "/01HZK3ZJWV00000000000P34QQ/01HZK3ZJWV00000000000P34QR",
      "requestId": "/01HZK3ZJWV00000000000P34QQ/01HZK3ZJWV00000000000P34QR",
      "src": "STDERR"
    },
    "id": "cc4fc754-20df-4bbf-a8f0-8ea42be98403",
    "oracle": {
      "compartmentid": "ocid1.compartment.oc1..aaaaaaaaxxxxxxxx",
      "ingestedtime": "2024-06-05T02:35:27.280Z",
      "loggroupid": "ocid1.loggroup.oc1.phx.aaaaaaaaxxxxxxxx",
      "logid": "ocid1.log.oc1.phx.aaaaaaaaxxxxxxxx",
      "tenantid": "ocid1.tenancy.oc1..aaaaaaaaxxxxxxxx"
    },
    "source": "cn_func",
    "specversion": "1.0",
    "subject": "cn_helloworld_func",
    "time": "2024-06-05T02:35:13.013Z",
    "type": "com.oraclecloud.functions.application.functioninvoke"
  },
  "regionId": "us-phoenix-1"
}
```
以上



## #6でOKE上にデプロイした各種アプリケーションの実行ログをOCI Loggingから参照できるようにしてください

OCI Loggingを使い以下のLogを確認する。
* NodeのLog
* アプリケーションのLog

### NodeのLog
NodeのLogを確認する。
NodeとなるVMのCustom Logsを見ることで確認ができる。

![alt text](./images/03_log.png)
このLogからはNodeへのヘルスチェックなどのNodeに対するLogを取得することができる。


### アプリケーションのLog
次に、アプリケーションログを取得する。
Observability & Management > Logsを選択する。
以下のようにカスタムログを作成する。
（必要なポリシーは各自追加する。）
![alt text](./images/04_log.png)


次に、logが格納されるpathを設定する。pathは`/var/log/containers/*`を記載する。
![alt text](./images/05_log.png)

podのアプリケーションログがOCI Loggingで取得できる。
![alt text](./images/06_log.png)

このLogからはアプリケーションの通信やコンテナ内のLogが取得できる。

以上
