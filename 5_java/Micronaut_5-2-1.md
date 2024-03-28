## 5-2-1 Micronautで簡単なアプリケーションを実装してください(Micronaut編)

### SDKMANのインストール

バージョンは最新の4.3.7としている。

```console
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ curl -s "https://get.sdkman.io"

                                -+syyyyyyys:
                            `/yho:`       -yd.
                         `/yh/`             +m.
                       .oho.                 hy                          .`
                     .sh/`                   :N`                `-/o`  `+dyyo:.
                   .yh:`                     `M-          `-/osysoym  :hs` `-+sys:      hhyssssssssy+
                 .sh:`                       `N:          ms/-``  yy.yh-      -hy.    `.N-````````+N.
               `od/`                         `N-       -/oM-      ddd+`     `sd:     hNNm        -N:
              :do`                           .M.       dMMM-     `ms.      /d+`     `NMMs       `do
            .yy-                             :N`    ```mMMM.      -      -hy.       /MMM:       yh
          `+d+`           `:/oo/`       `-/osyh/ossssssdNMM`           .sh:         yMMN`      /m.
         -dh-           :ymNMMMMy  `-/shmNm-`:N/-.``   `.sN            /N-         `NMMy      .m/
       `oNs`          -hysosmMMMMydmNmds+-.:ohm           :             sd`        :MMM/      yy
      .hN+           /d:    -MMMmhs/-.`   .MMMh   .ss+-                 `yy`       sMMN`     :N.
     :mN/           `N/     `o/-`         :MMMo   +MMMN-         .`      `ds       mMMh      do
    /NN/            `N+....--:/+oooosooo+:sMMM:   hMMMM:        `my       .m+     -MMM+     :N.
   /NMo              -+ooooo+/:-....`...:+hNMN.  `NMMMd`        .MM/       -m:    oMMN.     hs
  -NMd`                                    :mm   -MMMm- .s/     -MMm.       /m-   mMMd     -N.
 `mMM/                                      .-   /MMh. -dMo     -MMMy        od. .MMMs..---yh
 +MMM.                                           sNo`.sNMM+     :MMMM/        sh`+MMMNmNm+++-
 mMMM-                                           /--ohmMMM+     :MMMMm.       `hyymmmdddo
 MMMMh.                  ````                  `-+yy/`yMMM/     :MMMMMy       -sm:.``..-:-.`
 dMMMMmo-.``````..-:/osyhddddho.           `+shdh+.   hMMM:     :MmMMMM/   ./yy/` `:sys+/+sh/
 .dMMMMMMmdddddmmNMMMNNNNNMMMMMs           sNdo-      dMMM-  `-/yd/MMMMm-:sy+.   :hs-      /N`
  `/ymNNNNNNNmmdys+/::----/dMMm:          +m-         mMMM+ohmo/.` sMMMMdo-    .om:       `sh
     `.-----+/.`       `.-+hh/`         `od.          NMMNmds/     `mmy:`     +mMy      `:yy.
           /moyso+//+ossso:.           .yy`          `dy+:`         ..       :MMMN+---/oys:
         /+m:  `.-:::-`               /d+                                    +MMMMMMMNh:`
        +MN/                        -yh.                                     `+hddhy+.
       /MM+                       .sh:
      :NMo                      -sh/
     -NMs                    `/yy:
    .NMy                  `:sh+.
   `mMm`               ./yds-
  `dMMMmyo:-.````.-:oymNy:`
  +NMMMMMMMMMMMMMMMMms:`
    -+shmNMMMNmdy+:`


                                                                 Now attempting installation...


Looking for a previous installation of SDKMAN...
Looking for unzip...
Looking for zip...
Looking for curl...
Looking for sed...
Installing SDKMAN scripts...
Create distribution directories...
Getting available candidates...
Prime platform file...
Prime the config file...
Installing script cli archive...
* Downloading...
######################################################################## 100.0%
* Checking archive integrity...
* Extracting archive...
* Copying archive contents...
* Cleaning up...

Installing script cli archive...
* Downloading...
######################################################################## 100.0%
* Checking archive integrity...
* Extracting archive...
* Copying archive contents...
* Cleaning up...

Set version to 5.18.2 ...
Set native version to 0.4.6 ...
Attempt update of interactive bash profile on regular UNIX...
Added sdkman init snippet to /home/opc/.bashrc
Attempt update of zsh profile...
Updated existing /home/opc/.zshrc



All done!


You are subscribed to the STABLE channel.

Please open a new terminal, or run the following in the existing one:

    source "/home/opc/.sdkman/bin/sdkman-init.sh"

Then issue the following command:

    sdk help

Enjoy!!!
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ sdk update

No new candidates found at this time.
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ sdk install micronaut

Downloading: micronaut 4.3.7

In progress...

############################################################################################################################################################################# 100.0%

Installing: micronaut 4.3.7
Done installing!


Setting micronaut 4.3.7 as default.
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ 
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ sdk list micronaut
================================================================================
Available Micronaut Versions
================================================================================
 > * 4.3.7               3.8.5               3.1.1               2.0.0.M2       
     4.3.6               3.8.4               3.1.0               2.0.0.M1       
     4.3.5               3.8.3               3.0.3               1.3.7          
     4.3.4               3.8.2               3.0.2               1.3.6          
     4.3.3               3.8.1               3.0.1               1.3.5          

(省略)

[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ sdk install micronaut 4.3.7

micronaut 4.3.7 is already installed.
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ 
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ mn
mn> 
```

### サーバーアプリケーション作成（Maven）

アプリケーションを作成するときに、MetricsとHealthに必要なfeatureを追加しておく。`/greet`に対する`{"message": "Hello World"}`は、別途プログラムを作成する。

作成したプロジェクトは[こちら](./micronautguide/)

```console
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ mn create-app example.micronaut.micronautguide \
    --features=micrometer-annotation,data-jdbc,flyway,graalvm,validation,http-client,management \
    --build=maven \
    --lang=java \
    --test=junit
| Application created at /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ cd micronautguide/
[opc@admin2-vm1 micronautguide]$ tree
.
├── aot-jar.properties
├── aot-native-image.properties
├── micronaut-cli.yml
├── mvnw
├── mvnw.bat
├── pom.xml
├── README.md
├── src
│   ├── main
│   │   ├── java
│   │   │   └── example
│   │   │       └── micronaut
│   │   │           └── Application.java
│   │   └── resources
│   │       ├── application.properties
│   │       └── logback.xml
│   └── test
│       └── java
│           └── example
│               └── micronaut
│                   └── MicronautguideTest.java
└── target
    ├── classes
    │   └── example
    │       └── micronaut
    │           └── Application.class
    ├── generated-sources
    │   └── annotations
    ├── generated-test-sources
    │   └── test-annotations
    └── test-classes
        ├── example
        │   └── micronaut
        │       ├── $MicronautguideTest$Definition$Exec.class
        │       ├── $MicronautguideTest$Definition$Reference.class
        │       ├── $MicronautguideTest$Definition.class
        │       └── MicronautguideTest.class
        └── META-INF
            └── micronaut
                └── io.micronaut.inject.BeanDefinitionReference
                    └── example.micronaut.$MicronautguideTest$Definition$Reference

24 directories, 17 files
[opc@admin2-vm1 micronautguide]$ 
```

### (補足) 一応実行して稼働状況を確認する。

#### `curl http://localhost:8080/health`を実行すると、`{"status": "UP"}` と返却される

アプリケーションを実行する。

```console
[opc@admin2-vm1 micronautguide]$ ./mvnw mn:run
[INFO] Scanning for projects...
[INFO] 
[INFO] ------------------< example.micronaut:micronautguide >------------------
[INFO] Building micronautguide 0.1
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] >>> mn:4.4.2:run (default-cli) > process-classes @ micronautguide >>>
[INFO] 
[INFO] --- enforcer:3.4.1:enforce (micronaut-enforce) @ micronautguide ---
[INFO] Rule 0: org.apache.maven.enforcer.rules.version.RequireJavaVersion passed
[INFO] Rule 1: io.micronaut.maven.enforcer.CheckSnakeYaml passed
[INFO] 
[INFO] --- mn:4.4.2:generate-openapi-generic (default-generate-openapi-generic) @ micronautguide ---
[INFO] 
[INFO] --- mn:4.4.2:generate-openapi-client (default-generate-openapi-client) @ micronautguide ---
[INFO] 
[INFO] --- mn:4.4.2:generate-openapi-server (default-generate-openapi-server) @ micronautguide ---
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ micronautguide ---
[INFO] Copying 2 resources from src/main/resources to target/classes
[INFO] 
[INFO] --- compiler:3.12.1:compile (default-compile) @ micronautguide ---
[INFO] Nothing to compile - all classes are up to date.
[INFO] 
[INFO] <<< mn:4.4.2:run (default-cli) < process-classes @ micronautguide <<<
[INFO] 
[INFO] 
[INFO] --- mn:4.4.2:run (default-cli) @ micronautguide ---
[INFO] 👀 Watching for changes in [src/main/java, src/main/resources]
 __  __ _                                  _   
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
06:20:55.265 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
06:20:55.406 [main] INFO  com.zaxxer.hikari.pool.HikariPool - HikariPool-1 - Added connection conn0: url=jdbc:h2:mem:devDb user=SA
06:20:55.407 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
06:20:55.642 [main] INFO  i.m.flyway.AbstractFlywayMigration - Running migrations for database with qualifier [default]
06:20:55.682 [main] INFO  org.flywaydb.core.FlywayExecutor - Database: jdbc:h2:mem:devDb (H2 2.2)
06:20:55.688 [main] WARN  o.f.c.i.database.base.Database - Flyway upgrade recommended: H2 2.2.224 is newer than this version of Flyway and support has not been tested. The latest supported version of H2 is 2.2.220.
06:20:55.710 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Schema history table "PUBLIC"."flyway_schema_history" does not exist yet
06:20:55.711 [main] INFO  o.f.core.internal.command.DbValidate - Successfully validated 0 migrations (execution time 00:00.015s)
06:20:55.711 [main] WARN  o.f.core.internal.command.DbValidate - No migrations found. Are your locations set up correctly?
06:20:55.723 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Creating Schema History table "PUBLIC"."flyway_schema_history" ...
06:20:55.757 [main] INFO  o.f.core.internal.command.DbMigrate - Current version of schema "PUBLIC": << Empty Schema >>
06:20:55.759 [main] INFO  o.f.core.internal.command.DbMigrate - Schema "PUBLIC" is up to date. No migration necessary.
06:20:55.996 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:20:55.997 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:20:56.126 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 1384ms. Server Running: http://admin2-vm1:8080
```

別コンソールで`curl http://localhost:8080/health`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/health
{"status":"UP"}
```

#### `curl http://localhost:8080/metrics`を実行すると、アプリケーションのメトリクス情報が返却される

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:8080/metrics`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/metrics
{"names":["executor","executor.active","executor.completed","executor.pool.core","executor.pool.max","executor.pool.size","executor.queue.remaining","executor.queued","hikaricp.connections","hikaricp.connections.acquire","hikaricp.connections.active","hikaricp.connections.creation","hikaricp.connections.idle","hikaricp.connections.max","hikaricp.connections.min","hikaricp.connections.pending","hikaricp.connections.timeout","hikaricp.connections.usage","http.server.requests","jvm.buffer.count","jvm.buffer.memory.used","jvm.buffer.total.capacity","jvm.classes.loaded","jvm.classes.unloaded","jvm.gc.concurrent.phase.time","jvm.gc.live.data.size","jvm.gc.max.data.size","jvm.gc.memory.allocated","jvm.gc.memory.promoted","jvm.gc.pause","jvm.memory.committed","jvm.memory.max","jvm.memory.used","jvm.threads.daemon","jvm.threads.live","jvm.threads.peak","jvm.threads.started","jvm.threads.states","logback.events","process.cpu.usage","process.files.max","process.files.open","process.start.time","process.uptime","system.cpu.count","system.cpu.usage","system.load.average.1m"]}[opc@admin2-vm1 ~]$
[opc@admin2-vm1 ~]$
```

特定のメトリクス項目を`/health`の後に追記すると、その情報が確認できる。

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/metrics/process.start.time
{"name":"process.start.time","measurements":[{"statistic":"VALUE","value":1.711574454305E9}],"description":"Start time of the process since unix epoch."}
```

#### `curl http://localhost:8080/greet`を実行すると、`{"message": "Hello world"}` と返却される

[./src/main/java/example/micronaut/HelloController.java](./micronautguide/src/main/java/example/micronaut/HelloController.java)ファイルを作成

```java
package example.micronaut;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

import java.util.Collections;
import java.util.Map;

@Controller("/greet")
public class HelloController {

    @Get 
    public Map<String, Object> index() {
        return Collections.singletonMap("message", "Hello World"); 
    }
}
```

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:8080/greet`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/greet
{"message":"Hello World"}
```

## 参考サイト

- [Micronaut QuickStart](https://docs.micronaut.io/latest/guide/index.html#quickStart)

- [Learn how to create a Hello World Micronaut application with a controller and a functional test.](https://guides.micronaut.io/latest/creating-your-first-micronaut-app-maven-java.html)

- [Micronaut build plugins offer several ways to build Docker images - JAR, GraalVM native executable, CRaC](https://guides.micronaut.io/latest/micronaut-docker-image-maven-java.html)

- [Learn how to expose a health endpoint for your Micronaut application.](https://guides.micronaut.io/latest/micronaut-health-endpoint-maven-java.html)

- [Learn how to collect standard and custom metrics with the Micronaut framework.](https://guides.micronaut.io/latest/micronaut-metrics-maven-java.html)
