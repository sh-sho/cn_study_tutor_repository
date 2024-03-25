## 5-2-1 Micronautで簡単なアプリケーションを実装してください

### 参考サイト

- [Micronaut QuickStart](https://docs.micronaut.io/latest/guide/index.html#quickStart)

- [CREATE AN EXECUTABLE JAR OF A MICRONAUT APPLICATION](https://guides.micronaut.io/latest/executable-jar-gradle-java.html)

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

作成したプロジェクトは[こちら](./micronautguide/)

```console
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ mn create-app example.micronaut.micronautguide --build=maven --lang=java
| Application created at /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ cd micronautguide/
[opc@admin2-vm1 micronautguide]$ tree
.
├── aot-jar.properties
├── micronaut-cli.yml
├── mvnw
├── mvnw.bat
├── pom.xml
├── README.md
└── src
    ├── main
    │   ├── java
    │   │   └── example
    │   │       └── micronaut
    │   │           └── Application.java
    │   └── resources
    │       ├── application.properties
    │       └── logback.xml
    └── test
        └── java
            └── example
                └── micronaut
                    └── MicronautguideTest.java

10 directories, 12 files

```

`./src/main/java/example/micronaut/HelloController.java`ファイルを作成

```java
package example.micronaut;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Produces;

@Controller("/hello") 
public class HelloController {
    @Get 
    @Produces(MediaType.TEXT_PLAIN) 
    public String index() {
        return "Hello World"; 
    }
}
```

`src/test/java/example/micronaut/HelloControllerTest.java`ファイルを作成

```java
package example.micronaut;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import io.micronaut.http.HttpRequest;
import io.micronaut.http.MediaType;
import io.micronaut.http.client.HttpClient;
import io.micronaut.http.client.annotation.Client;
import io.micronaut.test.extensions.junit5.annotation.MicronautTest;
import org.junit.jupiter.api.Test;

import jakarta.inject.Inject;

@MicronautTest 
public class HelloControllerTest {

    @Inject
    @Client("/")  
    HttpClient client;

    @Test
    public void testHello() {
        HttpRequest<?> request = HttpRequest.GET("/hello").accept(MediaType.TEXT_PLAIN);  
        String body = client.toBlocking().retrieve(request);

        assertNotNull(body);
        assertEquals("Hello World", body);
    }
}
```

テストを実行

```console
[opc@admin2-vm1 micronautguide]$ ./mvnw test
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------< example.micronaut:micronautguide >------------------
[INFO] Building micronautguide 0.1
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
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
[INFO] Recompiling the module because of changed source code.
[INFO] Compiling 2 source files with javac [debug parameters release 17] to target/classes
[INFO] Creating bean classes for 1 type elements
[INFO]
[INFO] --- resources:3.3.1:testResources (default-testResources) @ micronautguide ---
[INFO] skip non existing resourceDirectory /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/src/test/resources
[INFO]
[INFO] --- compiler:3.12.1:testCompile (default-testCompile) @ micronautguide ---
[INFO] Recompiling the module because of changed dependency.
[INFO] Compiling 2 source files with javac [debug parameters release 17] to target/test-classes
[INFO] Creating bean classes for 2 type elements
[INFO]
[INFO] --- mn:4.4.2:start-testresources-service (default-start-testresources-service) @ micronautguide ---
[INFO]
[INFO] --- surefire:3.2.5:test (default-test) @ micronautguide ---
[INFO] Using auto detected provider org.apache.maven.surefire.junitplatform.JUnitPlatformProvider
[INFO]
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running example.micronaut.HelloControllerTest
21:49:25.221 [main] INFO  i.m.c.DefaultApplicationContext$RuntimeConfiguredEnvironment - Established active environments: [test]
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 1.862 s -- in example.micronaut.HelloControllerTest
[INFO] Running example.micronaut.MicronautguideTest
21:49:26.374 [main] INFO  i.m.c.DefaultApplicationContext$RuntimeConfiguredEnvironment - Established active environments: [test]
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.142 s -- in example.micronaut.MicronautguideTest
[INFO]
[INFO] Results:
[INFO]
[INFO] Tests run: 2, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  8.272 s
[INFO] Finished at: 2024-03-25T21:49:26+09:00
[INFO] ------------------------------------------------------------------------
[opc@admin2-vm1 micronautguide]$

```

アプリケーションを実行

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
21:51:45.736 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 665ms. Server Running: http://admin2-vm1:8080
```

別コンソールで`curl http://localhost:8080/hello `を実行

```console
[opc@admin2-vm1 micronautguide]$ curl http://localhost:8080/hello
Hello World
```


