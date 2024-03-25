## 5-2-1 Helidonで簡単なアプリケーションを実装してください 

### Helidonは実装時点の最新バージョンを使用してください

バージョンは最新の4.0.6としている。

```console
[opc@admin2-vm1 5-2-Java_Standard]$ curl -O https://helidon.io/cli/latest/linux/helidon
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 21.6M  100 21.6M    0     0  6200k      0  0:00:03  0:00:03 --:--:-- 6198k
[opc@admin2-vm1 5-2-Java_Standard]$ chmod +x ./helidon
[opc@admin2-vm1 5-2-Java_Standard]$ sudo mv ./helidon /usr/local/bin/^C
[opc@admin2-vm1 5-2-Java_Standard]$ ll
total 22180
-rwxr-xr-x 1 opc opc 22711448 Mar 23 14:23 helidon
drwxr-xr-x 2 opc opc        6 Mar 23 13:03 readme.md
[opc@admin2-vm1 5-2-Java_Standard]$ sudo mv ./helidon /usr/local/bin/
[opc@admin2-vm1 5-2-Java_Standard]$ ll
total 0
drwxr-xr-x 2 opc opc 6 Mar 23 13:03 readme.md
[opc@admin2-vm1 5-2-Java_Standard]$ 
[opc@admin2-vm1 5-2-Java_Standard]$ helidon init
Looking up default Helidon version
Helidon versions
  (1) 4.0.6 
  (2) 3.2.6 
  (3) 2.6.6 
  (4) Show all versions 
Enter selection (default: 1): 4
Helidon versions
  (1) 4.0.6 
  (2) 4.0.5 
  (3) 4.0.4 
  (4) 4.0.3 
  (5) 4.0.2 
  (6) 4.0.1 
  (7) 4.0.0 
  (8) 3.2.6 
  (9) 3.2.5 
  (10) 3.2.4 
  (11) 3.2.3 
  (12) 3.2.2 
  (13) 3.2.1 
  (14) 3.2.0 
  (15) 3.1.2 
  (16) 3.1.1 
  (17) 3.1.0 
  (18) 3.0.2 
  (19) 3.0.1 
  (20) 3.0.0 
  (21) 2.6.6 
  (22) 2.6.5 
  (23) 2.6.4 
  (24) 2.6.3 
  (25) 2.6.2 
  (26) 2.6.1 
  (27) 2.6.0 
  (28) 2.5.6 
  (29) 2.5.5 
  (30) 2.5.4 
  (31) 2.5.3 
  (32) 2.5.2 
  (33) 2.5.1 
  (34) 2.5.0 
  (35) 2.4.2 
  (36) 2.4.1 
  (37) 2.4.0 
  (38) 2.3.4 
  (39) 2.3.3 
  (40) 2.3.2 
  (41) 2.3.1 
  (42) 2.3.0 
  (43) 2.2.2 
  (44) 2.2.1 
  (45) 2.2.0 
  (46) 2.1.0 
  (47) 2.0.2 
  (48) 2.0.1 
  (49) 2.0.0 
Enter selection (default: 1): 1

Helidon version: 4.0.6

| Helidon Flavor

Select a Flavor
  (1) se | Helidon SE
  (2) mp | Helidon MP
Enter selection (default: 1): 2

| Application Type

Select an Application Type
  (1) quickstart | Quickstart
  (2) database   | Database
  (3) custom     | Custom
  (4) oci        | OCI
Enter selection (default: 1): 1

| Media Support

Select a JSON library
  (1) jackson | Jackson
  (2) jsonb   | JSON-B
Enter selection (default: 2): 

| Customize Project

Project groupId (default: me.opc-helidon): 
Project artifactId (default: quickstart-mp): 
Project version (default: 1.0-SNAPSHOT): 
Java package name (default: me.opc.mp.quickstart): 

Switch directory to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp to use CLI

Start development loop? (default: n): 
[opc@admin2-vm1 5-2-Java_Standard]$ 
```

作成したプロジェクトは[こちら](./quickstart-mp/)


### 以下のような条件を満たすアプリケーションをHelidon またはMicronaut で実装してください
- `curl http://localhost:8080/health`を実行すると、`{“status”: “UP”, ”checks”: []}`と返却される
- `curl http://localhost:8080/metrics`を実行すると、アプリケーションのメトリクス情報が返却される
- `curl http://localhost:8080/greet`を実行すると、`{“message”: “Hello world”}`と返却される

Helidon4.x.xはJava21以上が必要なので、Java21のrpmをダウンロードしてインストール

[MP  —  Helidon MP 4.x Upgrade Guide](https://helidon.io/docs/v4/mp/guides/upgrade_4x)

`Java 17 is no longer supported in Helidon 4. Java 21 or newer is required`


```console
[opc@admin2-vm1 ~]$ wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm
--2024-03-23 14:43:08--  https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm
Resolving download.oracle.com (download.oracle.com)... 23.45.52.112
Connecting to download.oracle.com (download.oracle.com)|23.45.52.112|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 197124051 (188M) [application/x-redhat-package-manager]
Saving to: ‘jdk-21_linux-x64_bin.rpm’

jdk-21_linux-x64_bin.rpm                     100%[==============================================================================================>] 187.99M   159MB/s    in 1.2s    

2024-03-23 14:43:09 (159 MB/s) - ‘jdk-21_linux-x64_bin.rpm’ saved [197124051/197124051]

[opc@admin2-vm1 ~]$ sudo rpm -ivh jdk-21_linux-x64_bin.rpm 
warning: jdk-21_linux-x64_bin.rpm: Header V3 RSA/SHA256 Signature, key ID ad986da3: NOKEY
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:jdk-21-2000:21.0.2-13            ################################# [100%]
[opc@admin2-vm1 ~]$ 
[opc@admin2-vm1 ~]$ alternatives --config java

There are 3 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
   1           /usr/lib/jvm/jre-1.8-oracle-x64/bin/java
   2           /usr/lib/jvm/jdk-17-oracle-x64/bin/java
*+ 3           /usr/lib/jvm/jdk-21-oracle-x64/bin/java

Enter to keep the current selection[+], or type selection number: 3
failed to create /var/lib/alternatives/java.new: Permission denied
[opc@admin2-vm1 ~]$ java -version
java version "21.0.2" 2024-01-16 LTS
Java(TM) SE Runtime Environment (build 21.0.2+13-LTS-58)
Java HotSpot(TM) 64-Bit Server VM (build 21.0.2+13-LTS-58, mixed mode, sharing)
```

#### プロジェクトのビルド

```console
[opc@admin2-vm1 quickstart-mp]$ mvn package
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] Detecting the operating system and CPU architecture
[INFO] ------------------------------------------------------------------------
[INFO] os.detected.name: linux
[INFO] os.detected.arch: x86_64
[INFO] os.detected.version: 5.15
[INFO] os.detected.version.major: 5
[INFO] os.detected.version.minor: 15
[INFO] os.detected.release: ol
[INFO] os.detected.release.version: 9.3
[INFO] os.detected.release.like.ol: true
[INFO] os.detected.release.like.fedora: true
[INFO] os.detected.classifier: linux-x86_64
[INFO] 
[INFO] --------------------< me.opc-helidon:quickstart-mp >--------------------
[INFO] Building quickstart-mp 1.0-SNAPSHOT
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ quickstart-mp ---
[INFO] Copying 4 resources from src/main/resources to target/classes
[INFO] 
[INFO] --- compiler:3.11.0:compile (default-compile) @ quickstart-mp ---
[INFO] Changes detected - recompiling the module! :source
[INFO] Compiling 5 source files with javac [debug release 21] to target/classes
[INFO] 
[INFO] --- jandex:3.1.2:jandex (make-index) @ quickstart-mp ---
[INFO] Saving Jandex index: /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/classes/META-INF/jandex.idx
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ quickstart-mp ---
[INFO] Copying 2 resources from src/test/resources to target/test-classes
[INFO] 
[INFO] --- compiler:3.11.0:testCompile (default-testCompile) @ quickstart-mp ---
[INFO] Changes detected - recompiling the module! :dependency
[INFO] Compiling 1 source file with javac [debug release 21] to target/test-classes
[INFO] 
[INFO] --- surefire:3.1.0:test (default-test) @ quickstart-mp ---
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/maven-surefire-common/3.1.0/maven-surefire-common-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/maven-surefire-common/3.1.0/maven-surefire-common-3.1.0.pom (6.1 kB at 15 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-api/3.1.0/surefire-api-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-api/3.1.0/surefire-api-3.1.0.pom (3.5 kB at 236 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-logger-api/3.1.0/surefire-logger-api-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-logger-api/3.1.0/surefire-logger-api-3.1.0.pom (3.3 kB at 297 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-shared-utils/3.1.0/surefire-shared-utils-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-shared-utils/3.1.0/surefire-shared-utils-3.1.0.pom (4.1 kB at 507 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-api/3.1.0/surefire-extensions-api-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-api/3.1.0/surefire-extensions-api-3.1.0.pom (3.3 kB at 331 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-booter/3.1.0/surefire-booter-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-booter/3.1.0/surefire-booter-3.1.0.pom (4.5 kB at 495 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-spi/3.1.0/surefire-extensions-spi-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-spi/3.1.0/surefire-extensions-spi-3.1.0.pom (1.8 kB at 160 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/maven-common-artifact-filters/3.1.1/maven-common-artifact-filters-3.1.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/maven-common-artifact-filters/3.1.1/maven-common-artifact-filters-3.1.1.pom (5.8 kB at 362 kB/
s)                                                                                                                                                                                  Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-settings/3.2.5/maven-settings-3.2.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-settings/3.2.5/maven-settings-3.2.5.pom (2.2 kB at 217 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-settings-builder/3.2.5/maven-settings-builder-3.2.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-settings-builder/3.2.5/maven-settings-builder-3.2.5.pom (2.6 kB at 288 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-interpolation/1.21/plexus-interpolation-1.21.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-interpolation/1.21/plexus-interpolation-1.21.pom (1.5 kB at 192 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-repository-metadata/3.2.5/maven-repository-metadata-3.2.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-repository-metadata/3.2.5/maven-repository-metadata-3.2.5.pom (2.2 kB at 111 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-plugin-api/3.2.5/maven-plugin-api-3.2.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-plugin-api/3.2.5/maven-plugin-api-3.2.5.pom (3.0 kB at 216 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/org.eclipse.sisu.plexus/0.3.5/org.eclipse.sisu.plexus-0.3.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/org.eclipse.sisu.plexus/0.3.5/org.eclipse.sisu.plexus-0.3.5.pom (4.3 kB at 330 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/sisu-plexus/0.3.5/sisu-plexus-0.3.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/sisu-plexus/0.3.5/sisu-plexus-0.3.5.pom (14 kB at 654 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/javax/annotation/javax.annotation-api/1.2/javax.annotation-api-1.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/javax/annotation/javax.annotation-api/1.2/javax.annotation-api-1.2.pom (13 kB at 790 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/javax/enterprise/cdi-api/1.2/cdi-api-1.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/javax/enterprise/cdi-api/1.2/cdi-api-1.2.pom (6.3 kB at 697 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/jboss/weld/weld-parent/26/weld-parent-26.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/jboss/weld/weld-parent/26/weld-parent-26.pom (32 kB at 3.2 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/org.eclipse.sisu.inject/0.3.5/org.eclipse.sisu.inject-0.3.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/org.eclipse.sisu.inject/0.3.5/org.eclipse.sisu.inject-0.3.5.pom (2.6 kB at 328 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/sisu-inject/0.3.5/sisu-inject-0.3.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/sisu/sisu-inject/0.3.5/sisu-inject-0.3.5.pom (14 kB at 1.6 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-model-builder/3.2.5/maven-model-builder-3.2.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-model-builder/3.2.5/maven-model-builder-3.2.5.pom (3.0 kB at 374 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-aether-provider/3.2.5/maven-aether-provider-3.2.5.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-aether-provider/3.2.5/maven-aether-provider-3.2.5.pom (4.2 kB at 708 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/aether/aether-spi/1.0.0.v20140518/aether-spi-1.0.0.v20140518.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/aether/aether-spi/1.0.0.v20140518/aether-spi-1.0.0.v20140518.pom (2.1 kB at 228 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/aether/aether-impl/1.0.0.v20140518/aether-impl-1.0.0.v20140518.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/aether/aether-impl/1.0.0.v20140518/aether-impl-1.0.0.v20140518.pom (3.5 kB at 496 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/sonatype/sisu/sisu-guice/3.2.3/sisu-guice-3.2.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/sonatype/sisu/sisu-guice/3.2.3/sisu-guice-3.2.3.pom (11 kB at 1.4 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/sonatype/sisu/inject/guice-parent/3.2.3/guice-parent-3.2.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/sonatype/sisu/inject/guice-parent/3.2.3/guice-parent-3.2.3.pom (13 kB at 1.9 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/sonatype/forge/forge-parent/38/forge-parent-38.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/sonatype/forge/forge-parent/38/forge-parent-38.pom (19 kB at 1.7 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/16.0.1/guava-16.0.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/16.0.1/guava-16.0.1.pom (6.1 kB at 1.0 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/guava/guava-parent/16.0.1/guava-parent-16.0.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/guava/guava-parent/16.0.1/guava-parent-16.0.1.pom (7.3 kB at 1.0 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/maven-surefire-common/3.1.0/maven-surefire-common-3.1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/maven-surefire-common/3.1.0/maven-surefire-common-3.1.0.jar (306 kB at 7.5 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-api/3.1.0/surefire-api-3.1.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-logger-api/3.1.0/surefire-logger-api-3.1.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-api/3.1.0/surefire-extensions-api-3.1.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-booter/3.1.0/surefire-booter-3.1.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-spi/3.1.0/surefire-extensions-spi-3.1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-logger-api/3.1.0/surefire-logger-api-3.1.0.jar (14 kB at 283 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/eclipse/aether/aether-api/1.0.0.v20140518/aether-api-1.0.0.v20140518.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-api/3.1.0/surefire-api-3.1.0.jar (170 kB at 2.5 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/maven-common-artifact-filters/3.1.1/maven-common-artifact-filters-3.1.1.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-api/3.1.0/surefire-extensions-api-3.1.0.jar (26 kB at 345 kB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-extensions-spi/3.1.0/surefire-extensions-spi-3.1.0.jar (8.2 kB at 120 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-shared-utils/3.1.0/surefire-shared-utils-3.1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-booter/3.1.0/surefire-booter-3.1.0.jar (118 kB at 1.4 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/maven-common-artifact-filters/3.1.1/maven-common-artifact-filters-3.1.1.jar (61 kB at 822 kB/s
)                                                                                                                                                                                   Downloaded from central: https://repo.maven.apache.org/maven2/org/eclipse/aether/aether-api/1.0.0.v20140518/aether-api-1.0.0.v20140518.jar (136 kB at 1.5 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-shared-utils/3.1.0/surefire-shared-utils-3.1.0.jar (2.1 MB at 7.5 MB/s)
[INFO] Using auto detected provider org.apache.maven.surefire.junitplatform.JUnitPlatformProvider
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit-platform/3.1.0/surefire-junit-platform-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit-platform/3.1.0/surefire-junit-platform-3.1.0.pom (4.7 kB at 518 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-providers/3.1.0/surefire-providers-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-providers/3.1.0/surefire-providers-3.1.0.pom (2.6 kB at 654 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/common-java5/3.1.0/common-java5-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/common-java5/3.1.0/common-java5-3.1.0.pom (2.8 kB at 470 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.3.2/junit-platform-launcher-1.3.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.3.2/junit-platform-launcher-1.3.2.pom (2.2 kB at 443 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.3.2/junit-platform-engine-1.3.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.3.2/junit-platform-engine-1.3.2.pom (2.4 kB at 479 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2.pom (2.0 kB at 404 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.pom (1.7 kB at 421 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit-platform/3.1.0/surefire-junit-platform-3.1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit-platform/3.1.0/surefire-junit-platform-3.1.0.jar (27 kB at 4.5 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/common-java5/3.1.0/common-java5-3.1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/common-java5/3.1.0/common-java5-3.1.0.jar (18 kB at 1.5 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.3.2/junit-platform-engine-1.3.2.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.3.2/junit-platform-launcher-1.3.2.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.3.2/junit-platform-launcher-1.3.2.jar (95 kB at 3.8 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2.jar (78 kB at 3.9 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.jar (7.1 kB at 356 kB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.3.2/junit-platform-engine-1.3.2.jar (138 kB at 5.5 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.9.3/junit-jupiter-engine-5.9.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.9.3/junit-jupiter-engine-5.9.3.pom (3.2 kB at 457 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.9.3/junit-platform-engine-1.9.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.9.3/junit-platform-engine-1.9.3.pom (3.2 kB at 800 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.9.3/junit-jupiter-engine-5.9.3.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.9.3/junit-jupiter-engine-5.9.3.jar (247 kB at 15 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.9.3/junit-platform-engine-1.9.3.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.9.3/junit-platform-engine-1.9.3.jar (189 kB at 15 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.9.3/junit-platform-launcher-1.9.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.9.3/junit-platform-launcher-1.9.3.pom (3.0 kB at 504 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.9.3/junit-platform-launcher-1.9.3.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.9.3/junit-platform-launcher-1.9.3.jar (169 kB at 17 MB/s)
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running me.opc.mp.quickstart.MainTest
2024.03.23 14:44:37 WARNING io.helidon.openapi.OpenApiFeature Thread[#1,main,5,main]: Static OpenAPI file not found, checked: [META-INF/openapi.json, META-INF/openapi.yaml, META-IN
F/openapi.yml]                                                                                                                                                                      2024.03.23 14:44:37 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Registering JAX-RS Application: HelidonMP
2024.03.23 14:44:38 WARNING org.glassfish.jersey.server.wadl.WadlFeature Thread[#1,main,5,main]: JAX-B API not found . WADL feature is disabled.
2024.03.23 14:44:38 INFO io.helidon.webserver.ServerListener VirtualThread[#29,start @default (/0.0.0.0:0)]/runnable@ForkJoinPool-1-worker-1: [0x3a3a38fd] http://0.0.0.0:33063 boun
d for socket '@default'                                                                                                                                                             2024.03.23 14:44:38 INFO io.helidon.webserver.LoomServer Thread[#1,main,5,main]: Started all channels in 12 milliseconds. 3491 milliseconds since JVM startup. Java 21.0.2+13-LTS-58
2024.03.23 14:44:38 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Server started on http://localhost:33063 (and all other host addresses) in 3496 m
illiseconds (since JVM startup).                                                                                                                                                    2024.03.23 14:44:38 INFO io.helidon.common.features.HelidonFeatures Thread[#32,features-thread,5,main]: Helidon MP 4.0.6 features: [CDI, Config, Health, Metrics, Open API, Server]
2024.03.23 14:44:39 INFO io.helidon.webserver.ServerListener Thread[#27,server-@default-listener,5,main]: [0x3a3a38fd] @default socket closed.
2024.03.23 14:44:39 INFO io.helidon.webserver.LoomServer Thread[#1,main,5,main]: Helidon WebServer stopped all channels.
2024.03.23 14:44:39 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Server stopped in 17 milliseconds.
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 4.127 s - in me.opc.mp.quickstart.MainTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- dependency:3.6.0:copy-dependencies (copy-libs) @ quickstart-mp ---
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/doxia/doxia-sink-api/1.0/doxia-sink-api-1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/doxia/doxia-sink-api/1.0/doxia-sink-api-1.0.pom (1.4 kB at 173 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/doxia/doxia/1.0/doxia-1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/doxia/doxia/1.0/doxia-1.0.pom (9.6 kB at 1.2 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-parent/10/maven-parent-10.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-parent/10/maven-parent-10.pom (32 kB at 4.0 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/logkit/logkit/1.0.1/logkit-1.0.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/logkit/logkit/1.0.1/logkit-1.0.1.pom (147 B at 15 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/avalon-framework/avalon-framework/4.1.3/avalon-framework-4.1.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/avalon-framework/avalon-framework/4.1.3/avalon-framework-4.1.3.pom (167 B at 24 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/commons-beanutils/commons-beanutils/1.6/commons-beanutils-1.6.pom
Downloaded from central: https://repo.maven.apache.org/maven2/commons-beanutils/commons-beanutils/1.6/commons-beanutils-1.6.pom (2.3 kB at 257 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/commons-logging/commons-logging/1.0/commons-logging-1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/commons-logging/commons-logging/1.0/commons-logging-1.0.pom (163 B at 15 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/commons-collections/commons-collections/2.0/commons-collections-2.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/commons-collections/commons-collections/2.0/commons-collections-2.0.pom (171 B at 19 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/commons-collections/commons-collections/2.1/commons-collections-2.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/commons-collections/commons-collections/2.1/commons-collections-2.1.pom (3.3 kB at 477 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/xml-apis/xml-apis/1.0.b2/xml-apis-1.0.b2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/xml-apis/xml-apis/1.0.b2/xml-apis-1.0.b2.pom (2.2 kB at 321 kB/s)
[INFO] Copying helidon-microprofile-core-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-core-4.0.6.jar
[INFO] Copying helidon-microprofile-server-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-server-4.0.6.jar
[INFO] Copying helidon-webserver-observe-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-observe-4.0.6.jar
[INFO] Copying helidon-microprofile-cdi-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-cdi-4.0.6.jar
[INFO] Copying helidon-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-4.0.6.jar
[INFO] Copying weld-se-core-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/weld-se-core-4.0.6.jar
[INFO] Copying weld-core-impl-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/weld-core-impl-4.0.6.jar
[INFO] Copying weld-environment-common-5.1.1.SP2.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/weld-environment-common-5.1.1.SP2.jar
[INFO] Copying weld-api-5.0.SP3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/weld-api-5.0.SP3.jar
[INFO] Copying weld-spi-5.0.SP3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/weld-spi-5.0.SP3.jar
[INFO] Copying jboss-classfilewriter-1.3.0.Final.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jboss-classfilewriter-1.3.0.Final.jar
[INFO] Copying weld-lite-extension-translator-5.1.1.SP2.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/weld-lite-extension-translator-5.1.1.SP2.jar
[INFO] Copying jboss-logging-processor-2.2.1.Final.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jboss-logging-processor-2.2.1.Final.jar
[INFO] Copying jboss-logging-annotations-2.2.1.Final.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jboss-logging-annotations-2.2.1.Final.jar
[INFO] Copying jdeparser-2.0.3.Final.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jdeparser-2.0.3.Final.jar
[INFO] Copying helidon-common-features-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-features-4.0.6.jar
[INFO] Copying helidon-common-features-api-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-features-api-4.0.6.jar
[INFO] Copying helidon-webserver-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-4.0.6.jar
[INFO] Copying helidon-common-socket-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-socket-4.0.6.jar
[INFO] Copying helidon-common-key-util-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-key-util-4.0.6.jar
[INFO] Copying helidon-common-security-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-security-4.0.6.jar
[INFO] Copying helidon-common-task-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-task-4.0.6.jar
[INFO] Copying helidon-common-tls-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-tls-4.0.6.jar
[INFO] Copying helidon-http-media-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-http-media-4.0.6.jar
[INFO] Copying helidon-http-encoding-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-http-encoding-4.0.6.jar
[INFO] Copying helidon-webserver-static-content-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-static-content-4.0.6.jar
[INFO] Copying jakarta.enterprise.cdi-api-4.0.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.enterprise.cdi-api-4.0.1.jar
[INFO] Copying jakarta.enterprise.lang-model-4.0.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.enterprise.lang-model-4.0.1.jar
[INFO] Copying jakarta.el-api-5.0.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.el-api-5.0.1.jar
[INFO] Copying helidon-http-media-jsonp-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-http-media-jsonp-4.0.6.jar
[INFO] Copying helidon-webserver-context-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-context-4.0.6.jar
[INFO] Copying helidon-config-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-config-4.0.6.jar
[INFO] Copying helidon-inject-api-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-inject-api-4.0.6.jar
[INFO] Copying helidon-common-types-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-types-4.0.6.jar
[INFO] Copying helidon-jersey-server-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-jersey-server-4.0.6.jar
[INFO] Copying jersey-server-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-server-3.1.5.jar
[INFO] Copying jakarta.validation-api-3.0.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.validation-api-3.0.0.jar
[INFO] Copying helidon-config-yaml-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-config-yaml-4.0.6.jar
[INFO] Copying jersey-weld2-se-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-weld2-se-3.1.5.jar
[INFO] Copying jersey-cdi1x-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-cdi1x-3.1.5.jar
[INFO] Copying helidon-jersey-media-jsonp-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-jersey-media-jsonp-4.0.6.jar
[INFO] Copying jersey-media-json-processing-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-media-json-processing-3.1.5.jar
[INFO] Copying parsson-media-1.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/parsson-media-1.1.5.jar
[INFO] Copying helidon-microprofile-config-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-config-4.0.6.jar
[INFO] Copying helidon-config-mp-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-config-mp-4.0.6.jar
[INFO] Copying helidon-config-encryption-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-config-encryption-4.0.6.jar
[INFO] Copying helidon-common-crypto-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-crypto-4.0.6.jar
[INFO] Copying helidon-config-object-mapping-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-config-object-mapping-4.0.6.jar
[INFO] Copying helidon-microprofile-openapi-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-openapi-4.0.6.jar
[INFO] Copying helidon-openapi-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-openapi-4.0.6.jar
[INFO] Copying helidon-common-config-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-config-4.0.6.jar
[INFO] Copying helidon-common-mapper-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-mapper-4.0.6.jar
[INFO] Copying helidon-common-media-type-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-media-type-4.0.6.jar
[INFO] Copying microprofile-config-api-3.0.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/microprofile-config-api-3.0.3.jar
[INFO] Copying microprofile-openapi-api-3.1.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/microprofile-openapi-api-3.1.1.jar
[INFO] Copying helidon-webserver-service-common-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-service-common-4.0.6.jar
[INFO] Copying helidon-webserver-cors-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-cors-4.0.6.jar
[INFO] Copying helidon-cors-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-cors-4.0.6.jar
[INFO] Copying helidon-microprofile-service-common-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-service-common-4.0.6.jar
[INFO] Copying smallrye-open-api-core-3.3.4.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/smallrye-open-api-core-3.3.4.jar
[INFO] Copying jboss-logging-3.5.3.Final.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jboss-logging-3.5.3.Final.jar
[INFO] Copying smallrye-open-api-jaxrs-3.3.4.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/smallrye-open-api-jaxrs-3.3.4.jar
[INFO] Copying snakeyaml-2.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/snakeyaml-2.0.jar
[INFO] Copying helidon-microprofile-health-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-health-4.0.6.jar
[INFO] Copying microprofile-health-api-4.0.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/microprofile-health-api-4.0.1.jar
[INFO] Copying helidon-webserver-observe-health-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-observe-health-4.0.6.jar
[INFO] Copying helidon-health-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-health-4.0.6.jar
[INFO] Copying jakarta.json.bind-api-3.0.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.json.bind-api-3.0.0.jar
[INFO] Copying jersey-media-json-binding-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-media-json-binding-3.1.5.jar
[INFO] Copying jersey-common-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-common-3.1.5.jar
[INFO] Copying jakarta.ws.rs-api-3.1.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.ws.rs-api-3.1.0.jar
[INFO] Copying jakarta.annotation-api-2.1.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.annotation-api-2.1.1.jar
[INFO] Copying jakarta.inject-api-2.0.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.inject-api-2.0.1.jar
[INFO] Copying osgi-resource-locator-1.0.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/osgi-resource-locator-1.0.3.jar
[INFO] Copying jakarta.json-api-2.1.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.json-api-2.1.3.jar
[INFO] Copying parsson-1.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/parsson-1.1.5.jar
[INFO] Copying yasson-3.0.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/yasson-3.0.3.jar
[INFO] Copying helidon-logging-jul-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-logging-jul-4.0.6.jar
[INFO] Copying helidon-common-context-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-context-4.0.6.jar
[INFO] Copying helidon-logging-common-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-logging-common-4.0.6.jar
[INFO] Copying helidon-common-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-4.0.6.jar
[INFO] Copying jandex-3.1.2.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jandex-3.1.2.jar
[INFO] Copying jakarta.activation-api-2.1.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.activation-api-2.1.1.jar
[INFO] Copying microprofile-metrics-api-5.0.1.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/microprofile-metrics-api-5.0.1.jar
[INFO] Copying jakarta.interceptor-api-2.1.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jakarta.interceptor-api-2.1.0.jar
[INFO] Copying helidon-microprofile-metrics-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-microprofile-metrics-4.0.6.jar
[INFO] Copying helidon-webserver-observe-metrics-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-webserver-observe-metrics-4.0.6.jar
[INFO] Copying helidon-metrics-providers-micrometer-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-metrics-providers-micrometer-4.0.6.ja
r                                                                                                                                                                                   [INFO] Copying micrometer-core-1.11.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/micrometer-core-1.11.3.jar
[INFO] Copying micrometer-commons-1.11.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/micrometer-commons-1.11.3.jar
[INFO] Copying micrometer-observation-1.11.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/micrometer-observation-1.11.3.jar
[INFO] Copying HdrHistogram-2.1.12.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/HdrHistogram-2.1.12.jar
[INFO] Copying LatencyUtils-2.0.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/LatencyUtils-2.0.3.jar
[INFO] Copying micrometer-registry-prometheus-1.11.3.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/micrometer-registry-prometheus-1.11.3.jar
[INFO] Copying simpleclient_common-0.16.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/simpleclient_common-0.16.0.jar
[INFO] Copying simpleclient-0.16.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/simpleclient-0.16.0.jar
[INFO] Copying simpleclient_tracer_otel-0.16.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/simpleclient_tracer_otel-0.16.0.jar
[INFO] Copying simpleclient_tracer_otel_agent-0.16.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/simpleclient_tracer_otel_agent-0.16.0.jar
[INFO] Copying simpleclient_tracer_common-0.16.0.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/simpleclient_tracer_common-0.16.0.jar
[INFO] Copying helidon-metrics-api-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-metrics-api-4.0.6.jar
[INFO] Copying helidon-http-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-http-4.0.6.jar
[INFO] Copying helidon-common-configurable-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-configurable-4.0.6.jar
[INFO] Copying helidon-common-buffers-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-buffers-4.0.6.jar
[INFO] Copying helidon-common-uri-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-uri-4.0.6.jar
[INFO] Copying helidon-common-parameters-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-common-parameters-4.0.6.jar
[INFO] Copying helidon-builder-api-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-builder-api-4.0.6.jar
[INFO] Copying helidon-metrics-system-meters-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-metrics-system-meters-4.0.6.jar
[INFO] Copying jersey-client-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-client-3.1.5.jar
[INFO] Copying jersey-hk2-3.1.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/jersey-hk2-3.1.5.jar
[INFO] Copying hk2-locator-3.0.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/hk2-locator-3.0.5.jar
[INFO] Copying aopalliance-repackaged-3.0.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/aopalliance-repackaged-3.0.5.jar
[INFO] Copying hk2-api-3.0.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/hk2-api-3.0.5.jar
[INFO] Copying hk2-utils-3.0.5.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/hk2-utils-3.0.5.jar
[INFO] Copying javassist-3.29.2-GA.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/javassist-3.29.2-GA.jar
[INFO] Copying helidon-config-yaml-mp-4.0.6.jar to /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/libs/helidon-config-yaml-mp-4.0.6.jar
[INFO] 
[INFO] --- jar:3.3.0:jar (default-jar) @ quickstart-mp ---
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/file-management/3.1.0/file-management-3.1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/file-management/3.1.0/file-management-3.1.0.pom (4.5 kB at 1.1 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/maven-shared-components/36/maven-shared-components-36.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/maven-shared-components/36/maven-shared-components-36.pom (4.9 kB at 1.2 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-archiver/3.6.0/maven-archiver-3.6.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-archiver/3.6.0/maven-archiver-3.6.0.pom (3.9 kB at 784 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-io/3.4.0/plexus-io-3.4.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-io/3.4.0/plexus-io-3.4.0.pom (6.0 kB at 1.2 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-archiver/4.4.0/plexus-archiver-4.4.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-archiver/4.4.0/plexus-archiver-4.4.0.pom (6.3 kB at 1.6 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.21/commons-compress-1.21.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.21/commons-compress-1.21.pom (20 kB at 6.6 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-utils/3.4.2/plexus-utils-3.4.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-utils/3.4.2/plexus-utils-3.4.2.pom (8.2 kB at 2.7 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus/8/plexus-8.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus/8/plexus-8.pom (25 kB at 6.4 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/file-management/3.1.0/file-management-3.1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/shared/file-management/3.1.0/file-management-3.1.0.jar (36 kB at 7.3 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-archiver/3.6.0/maven-archiver-3.6.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-io/3.4.0/plexus-io-3.4.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-archiver/4.4.0/plexus-archiver-4.4.0.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/maven-archiver/3.6.0/maven-archiver-3.6.0.jar (26 kB at 2.4 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-io/3.4.0/plexus-io-3.4.0.jar (79 kB at 3.1 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-archiver/4.4.0/plexus-archiver-4.4.0.jar (211 kB at 6.8 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-utils/3.4.2/plexus-utils-3.4.2.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-utils/3.4.2/plexus-utils-3.4.2.jar (267 kB at 6.9 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar (1.0 MB at 18 MB/s)
[INFO] Building jar: /home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp/target/quickstart-mp.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  12.714 s
[INFO] Finished at: 2024-03-23T14:44:41+09:00
[INFO] ------------------------------------------------------------------------

```
