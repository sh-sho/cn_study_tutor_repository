# Java基礎 #5-2-3 #5-1-1で実装したアプリケーションをコンテナとして実行してください

## Goals
* コンテナ実行環境はOKEでもContainer InstancesでもDockerでも..

## Practices
できてないです、、、、



pomファイルに以下を追記する。
```xml
<plugin>
  <groupId>com.google.cloud.tools</groupId>
  <artifactId>jib-maven-plugin</artifactId>
  <configuration>
    <to>
      <image>docker.io/my-company/my-image:${project.version}</image>
    </to>
  </configuration>
</plugin>
```

## dockerと連携
docker loginを行う
```console


