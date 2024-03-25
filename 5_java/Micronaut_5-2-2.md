## 5-2-2 #5-1-1で実装したアプリケーションをExecutable JARとして実行してください

## 参考サイト

[CREATE AN EXECUTABLE JAR OF A MICRONAUT APPLICATION](https://guides.micronaut.io/latest/executable-jar-gradle-java.html)

### サーバーアプリケーション作成（Gradle）

作成したプロジェクトは[こちら](./micronautguide_gradle/)

```console
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ mn create-app example.micronaut.micronautguide_gradle --build=gradle --lang=java
| Application created at /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide_gradle
[opc@admin2-vm1 5-2-Java_Standard_Micronout]$ cd micronautguide_gradle/
[opc@admin2-vm1 micronautguide_gradle]$ 
[opc@admin2-vm1 micronautguide_gradle]$ 
[opc@admin2-vm1 micronautguide_gradle]$ tree
.
├── build.gradle
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradle.properties
├── gradlew
├── gradlew.bat
├── micronaut-cli.yml
├── README.md
├── settings.gradle
└── src
    ├── main
    │   ├── java
    │   │   └── example
    │   │       └── micronaut
    │   │           └── Application.java
    │   └── resources
    │       ├── application.properties
    │       └── logback.xml
    └── test
        └── java
            └── example
                └── micronaut
                    └── Micronautguide_gradleTest.java

12 directories, 13 files
[opc@admin2-vm1 micronautguide_gradle]$ 
```

`./src/main/java/example/micronaut/HelloController.java`ファイルを作成

```java
package example.micronaut;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

import java.util.Collections;
import java.util.Map;

@Controller 
public class HelloController {

    @Get 
    public Map<String, Object> index() {
        return Collections.singletonMap("message", "Hello World"); 
    }
}
```

Executable JARを作成

```console
[opc@admin2-vm1 micronautguide_gradle]$ ./gradlew shadowJar

> Task :compileJava
Note: Creating bean classes for 1 type elements

BUILD SUCCESSFUL in 13s
3 actionable tasks: 3 executed
[opc@admin2-vm1 micronautguide_gradle]$ 
```

アプリケーションを実行

```console
[opc@admin2-vm1 micronautguide_gradle]$ java -jar build/libs/micronautguide_gradle-0.1-all.jar 
 __  __ _                                  _   
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
22:10:26.951 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 981ms. Server Running: http://admin2-vm1:8080
```

別コンソールで`curl http://localhost:8080/hello `を実行

```console
[opc@admin2-vm1 micronautguide]$ curl http://localhost:8080
{"message":"Hello World"}
```
