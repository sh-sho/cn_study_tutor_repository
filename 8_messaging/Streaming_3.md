# Kafka Console Clientを用いてStreamingにメッセージをPub/Subできることを確認してください

参考：[Apache Kafkaでのストリーミングの使用](https://docs.oracle.com/ja-jp/iaas/Content/Streaming/Tasks/kafkacompatibility.htm)

参考：[OCIのチュートリアル](https://oracle-japan.github.io/ocitutorials/datascience/streaming-for-beginner/#%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3-kafka-console-client-%E3%82%92%E7%94%A8%E3%81%84%E3%81%9F%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%81%AE-pubsub)

最新版を[ダウンロード](https://kafka.apache.org/downloads)
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ wget https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz
--2024-05-17 11:10:46--  https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz
Resolving downloads.apache.org (downloads.apache.org)... 88.99.208.237, 135.181.214.104, 2a01:4f8:10a:39da::2, ...
Connecting to downloads.apache.org (downloads.apache.org)|88.99.208.237|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 119028138 (114M) [application/x-gzip]
Saving to: ‘kafka_2.13-3.7.0.tgz’

100%[================================================================================================================================================================================================>] 119,028,138 27.3MB/s   in 4.9s   

2024-05-17 11:10:52 (23.3 MB/s) - ‘kafka_2.13-3.7.0.tgz’ saved [119028138/119028138]

ritsuko_to@cloudshell:~ (us-ashburn-1)$ ls
7_CICD           cicd-functions-handson                    fn-hello         k8s                   nginx_nodeport.yaml  pythonfn2      README.md               ssh-key-2024-03-21.key.pub  suggestion_variable.txt
build_spec.yaml  db-sample-schemas-23.2                    helloworld-func  kafka_2.13-3.7.0.tgz  oradiag_ritsuko_to   pythonfn2.zip  sample.json             ssh-key-2024-03-22.key      terraform
CICD             devops-template-for-oracle-functions.zip  hr_install.log   network               prepare              quickstart-mp  ssh-key-2024-03-21.key  ssh-key-2024-03-22.key.pub  v23.2.zip
```
展開
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ tar -xzvf kafka_2.13-3.7.0.tgz
```


```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ export KAFKA_HOME=$HOME/kafka_2.13-3.7.0
ritsuko_to@cloudshell:~ (us-ashburn-1)$ echo $KAFKA_HOME
/home/ritsuko_to/kafka_2.13-3.7.0
ritsuko_to@cloudshell:~ (us-ashburn-1)$ 
```

接続ファイルの作成（producer-streaming.properties）
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ cat $KAFKA_HOME/config/producer-streaming.properties
bootstrap.servers=cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092
compression.type=none
security.protocol=SASL_SSL
sasl.mechanism=PLAIN
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="orasejapan/ritsuko.tokunaga@oracle.com/ocid1.streampool.oc1.iad.amaaaaaassl65iqazl6dom7j2l6vkwucpaftts5llop6sdvngmcemjifnahq" password="2;DW4)psrDAL:7u7SPI;"xxxxx;

```
接続ファイルの作成（consumer-streaming.properties）
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ cat $KAFKA_HOME/config/consumer-streaming.properties
bootstrap.servers=cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092
group.id=handson-consumer-group
session.timeout.ms=30000
security.protocol=SASL_SSL
sasl.mechanism=PLAIN
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="orasejapan/ritsuko.tokunaga@oracle.com/ocid1.streampool.oc1.iad.amaaaaaassl65iqazl6dom7j2l6vkwucpaftts5llop6sdvngmcemjifnahq" password="2;DW4)psrDAL:7u7SPI;";

```
実行
```
ritsuko_to@cloudshell:~ (us-ashburn-1)$ $KAFKA_HOME/bin/kafka-console-producer.sh --bootstrap-server cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 --topic HandsonStream --producer.config $KAFKA_HOME/config/producer-streaming.properties
>[2024-05-17 11:22:43,026] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/147.154.53.26:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:43,027] WARN [Producer clientId=console-producer] Bootstrap broker cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 (id: -1 rack: null) disconnected (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:43,434] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/130.35.98.90:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:43,435] WARN [Producer clientId=console-producer] Bootstrap broker cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 (id: -1 rack: null) disconnected (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:44,127] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/169.155.150.197:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:44,128] WARN [Producer clientId=console-producer] Bootstrap broker cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 (id: -1 rack: null) disconnected (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:45,342] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/147.154.53.26:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:45,343] WARN [Producer clientId=console-producer] Bootstrap broker cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 (id: -1 rack: null) disconnected (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:46,472] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/130.35.98.90:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:46,472] WARN [Producer clientId=console-producer] Bootstrap broker cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 (id: -1 rack: null) disconnected (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:47,719] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/169.155.150.197:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:47,719] WARN [Producer clientId=console-producer] Bootstrap broker cell-1.streaming.us-ashburn-1.oci.oraclecloud.com:9092 (id: -1 rack: null) disconnected (org.apache.kafka.clients.NetworkClient)
[2024-05-17 11:22:48,939] ERROR [Producer clientId=console-producer] Connection to node -1 (cell-1.streaming.us-ashburn-1.oci.oraclecloud.com/147.154.53.26:9092) failed authentication due to: Authentication failed (org.apache.kafka.clients.NetworkClient)
```



