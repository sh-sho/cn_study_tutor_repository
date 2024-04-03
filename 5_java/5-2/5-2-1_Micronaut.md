# Java基礎 #5-2-1 Helidon or Micronautで簡単なアプリケーションを実装してください

## Goals
### 前提
* Helidon もしくは、Micronaut は実装時点の最新バージョンを使用してください
* /health, /metrics については、別のパスで実行されるように実装してもOK です
### 以下のような条件を満たすアプリケーションをHelidon またはMicronaut で実装してください
* `curl http://localhost:8080/health`を実行すると、{“status”: “UP”, ”checks”: []} と返却される
* `curl http://localhost:8080/metrics`を実行すると、アプリケーションのメトリクス情報が返却される
* `curl http://localhost:8080/greet`を実行すると、{“message”: “Hello world”} と返却される

## Micronautのインストール
### Javaのバージョン確認
Javaのバージョンを確認する。
```console
$ java --version
openjdk 21.0.2 2024-01-16
OpenJDK Runtime Environment (build 21.0.2+13-Ubuntu-122.04.1)
OpenJDK 64-Bit Server VM (build 21.0.2+13-Ubuntu-122.04.1, mixed mode, sharing)
```

### SDKMANのインストール
今回はSDKMANを使い、Micronautをインストールする。
まず[SDKMAN](#https://micronaut.io/download/)をインストールする。
```console
$ curl -s "https://get.sdkman.io" | bash
$ source "$HOME/.sdkman/bin/sdkman-init.sh"
```

### Micronautのインストール
次に、Micronautをインストールする。
```console
$ sdk install micronaut
$ mn --version
```

## アプリケーションの作成
mnコマンドでアプリケーションを作成する。
```console
$ mn create-app com.oracle.helloworld --features=management,micrometer-atlas --build=maven
| Application created at /home/ubuntu/cn_study_tutor_repository/5_java/5-2/helloworld
```
詳細
* /health, /metricsのエンドポイントを作成するために`--features=management`をオプションで付けている。
* mavenを使うため、`--build=maven`を付けている。

## /greetを作成する。
Greet.javaファイルを作成する。
```console
$ touch ./helloworld/src/main/java/com/oracle/Greet.java
```
`Greet.java`
```java
package com.oracle;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.*;

@Controller("/greet")
public class Greet {
    @Get(produces = MediaType.TEXT_PLAIN)
    public String index() {
        return "{\"message\": \"Hello world\"}";
    }
}
```

## ビルド、パッケージ、実行を行う
```console
$ ./mvnw mn:run
```

各エンドポイントにアクセスする。

エンドポイント /

`http://localhost:8080/`
```json
{
  "_links": {
    "self": [
      {
        "href": "/",
        "templated": false
      }
    ]
  },
  "_embedded": {
    "errors": [
      {
        "message": "Page Not Found"
      }
    ]
  },
  "message": "Not Found"
}
```
エンドポイント /health

`http://localhost:8080/health`
```json
{
  "status": "UP"
}
```
エンドポイント /metrics

`http://localhost:8080/metrics`
```json
{
  "names": [
    "executor",
    "executor.active",
    "executor.completed",
    "executor.pool.core",
    "executor.pool.max",
    "executor.pool.size",
    "executor.queue.remaining",
    "executor.queued",
    "jvm.buffer.count",
    "jvm.buffer.memory.used",
    "jvm.buffer.total.capacity",
    "jvm.classes.loaded",
    "jvm.classes.unloaded",
    "jvm.gc.live.data.size",
    "jvm.gc.max.data.size",
    "jvm.gc.memory.allocated",
    "jvm.gc.memory.promoted",
    "jvm.memory.committed",
    "jvm.memory.max",
    "jvm.memory.used",
    "jvm.threads.daemon",
    "jvm.threads.live",
    "jvm.threads.peak",
    "jvm.threads.started",
    "jvm.threads.states",
    "logback.events",
    "process.cpu.usage",
    "process.files.max",
    "process.files.open",
    "process.start.time",
    "process.uptime",
    "system.cpu.count",
    "system.cpu.usage",
    "system.load.average.1m"
  ]
}
```

エンドポイント /metrics/system.cpu.usage

`http://localhost:8080/metrics/system.cpu.usage`
```json
{
  "name": "system.cpu.usage",
  "measurements": [
    {
      "statistic": "VALUE",
      "value": 0.023841059602649
    }
  ],
  "description": "The \"recent cpu usage\" of the system the application is running in"
}
```

エンドポイント /greet

`http://localhost:8080/greet`
```json
{"message": "Hello world"}
```
以上
