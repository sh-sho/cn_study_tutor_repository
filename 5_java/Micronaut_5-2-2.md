## 5-2-2 #5-1-1で実装したアプリケーションをExecutable JARとして実行してください

### サーバーアプリケーション作成

#### Executable JARファイルを作成

```console
[opc@admin2-vm1 micronautguide]$ ./mvnw package
[INFO] Scanning for projects...
[INFO] 
[INFO] ------------------< example.micronaut:micronautguide >------------------
[INFO] Building micronautguide 0.1
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/plugins/maven-shade-plugin/3.5.2/maven-shade-plugin-3.5.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/plugins/maven-shade-plugin/3.5.2/maven-shade-plugin-3.5.2.pom (14 kB at 50 kB/s)
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
[INFO] Recompiling the module because of added or removed source files.
[INFO] Compiling 3 source files with javac [debug parameters release 17] to target/classes
[INFO] Creating bean classes for 2 type elements
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ micronautguide ---
[INFO] skip non existing resourceDirectory /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/src/test/resources
[INFO] 
[INFO] --- compiler:3.12.1:testCompile (default-testCompile) @ micronautguide ---
[INFO] Recompiling the module because of changed dependency.
[INFO] Compiling 1 source file with javac [debug parameters release 17] to target/test-classes
[INFO] Creating bean classes for 1 type elements
[INFO] 
[INFO] --- mn:4.4.2:start-testresources-service (default-start-testresources-service) @ micronautguide ---
[INFO] 
[INFO] --- surefire:3.2.5:test (default-test) @ micronautguide ---
[INFO] Using auto detected provider org.apache.maven.surefire.junitplatform.JUnitPlatformProvider
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running example.micronaut.MicronautguideTest
06:46:43.140 [main] INFO  i.m.c.DefaultApplicationContext$RuntimeConfiguredEnvironment - Established active environments: [test]
06:46:43.342 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
06:46:43.516 [main] INFO  com.zaxxer.hikari.pool.HikariPool - HikariPool-1 - Added connection conn0: url=jdbc:h2:mem:devDb user=SA
06:46:43.517 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
06:46:43.789 [main] INFO  i.m.flyway.AbstractFlywayMigration - Running migrations for database with qualifier [default]
06:46:43.832 [main] INFO  org.flywaydb.core.FlywayExecutor - Database: jdbc:h2:mem:devDb (H2 2.2)
06:46:43.840 [main] WARN  o.f.c.i.database.base.Database - Flyway upgrade recommended: H2 2.2.224 is newer than this version of Flyway and support has not been tested. The latest supported version of H2 is 2.2.220.
06:46:43.853 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Schema history table "PUBLIC"."flyway_schema_history" does not exist yet
06:46:43.854 [main] INFO  o.f.core.internal.command.DbValidate - Successfully validated 0 migrations (execution time 00:00.005s)
06:46:43.854 [main] WARN  o.f.core.internal.command.DbValidate - No migrations found. Are your locations set up correctly?
06:46:43.861 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Creating Schema History table "PUBLIC"."flyway_schema_history" ...
06:46:43.900 [main] INFO  o.f.core.internal.command.DbMigrate - Current version of schema "PUBLIC": << Empty Schema >>
06:46:43.902 [main] INFO  o.f.core.internal.command.DbMigrate - Schema "PUBLIC" is up to date. No migration necessary.
06:46:44.209 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:46:44.211 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:46:44.400 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Shutdown initiated...
06:46:44.403 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Shutdown completed.
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 1.932 s -- in example.micronaut.MicronautguideTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- mn:4.4.2:aot-analysis (default-aot-analysis) @ micronautguide ---
[INFO] 
[INFO] --- jar:3.3.0:jar (default-jar) @ micronautguide ---
[INFO] Building jar: /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/micronautguide-0.1.jar
[INFO] 
[INFO] --- shade:3.5.2:shade (default-shade) @ micronautguide ---
Downloading from central: https://repo.maven.apache.org/maven2/org/jdom/jdom2/2.0.6.1/jdom2-2.0.6.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/jdom/jdom2/2.0.6.1/jdom2-2.0.6.1.pom (4.6 kB at 511 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/vafer/jdependency/2.10/jdependency-2.10.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/vafer/jdependency/2.10/jdependency-2.10.pom (14 kB at 1.4 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-collections4/4.4/commons-collections4-4.4.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-collections4/4.4/commons-collections4-4.4.pom (24 kB at 1.7 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.25.0/commons-compress-1.25.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.25.0/commons-compress-1.25.0.pom (22 kB at 2.4 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.32/slf4j-api-1.7.32.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.32/slf4j-api-1.7.32.jar (42 kB at 3.8 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/jdom/jdom2/2.0.6.1/jdom2-2.0.6.1.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/vafer/jdependency/2.10/jdependency-2.10.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-collections4/4.4/commons-collections4-4.4.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.25.0/commons-compress-1.25.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/jdom/jdom2/2.0.6.1/jdom2-2.0.6.1.jar (328 kB at 3.4 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/vafer/jdependency/2.10/jdependency-2.10.jar (416 kB at 3.9 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-collections4/4.4/commons-collections4-4.4.jar (752 kB at 4.8 MB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.25.0/commons-compress-1.25.0.jar (1.1 MB at 6.8 MB/s)
[INFO] Including io.micronaut:micronaut-http-client:jar:4.3.12 in the shaded jar.
[INFO] Including org.slf4j:slf4j-api:jar:2.0.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-context:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-aop:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-http-client-core:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-http:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-context-propagation:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-websocket:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-http-netty:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-buffer-netty:jar:4.3.12 in the shaded jar.
[INFO] Including io.netty:netty-codec-http2:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-handler:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-resolver:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-transport-native-unix-common:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-handler-proxy:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-common:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-buffer:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-transport:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-codec:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.netty:netty-codec-socks:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.projectreactor:reactor-core:jar:3.5.11 in the shaded jar.
[INFO] Including org.reactivestreams:reactive-streams:jar:1.0.4 in the shaded jar.
[INFO] Including io.micronaut:micronaut-http-server-netty:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-http-server:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-core:jar:4.3.12 in the shaded jar.
[INFO] Including io.netty:netty-codec-http:jar:4.1.108.Final in the shaded jar.
[INFO] Including io.micronaut:micronaut-management:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-router:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut:micronaut-discovery-core:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-jdbc:jar:4.6.2 in the shaded jar.
[INFO] Including io.micronaut:micronaut-inject:jar:4.3.12 in the shaded jar.
[INFO] Including jakarta.inject:jakarta.inject-api:jar:2.0.1 in the shaded jar.
[INFO] Including jakarta.annotation:jakarta.annotation-api:jar:2.1.1 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-runtime:jar:4.6.2 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-model:jar:4.6.2 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-tx:jar:4.6.2 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-tx-jdbc:jar:4.6.2 in the shaded jar.
[INFO] Including jakarta.transaction:jakarta.transaction-api:jar:2.0.1 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-connection-jdbc:jar:4.6.2 in the shaded jar.
[INFO] Including io.micronaut.data:micronaut-data-connection:jar:4.6.2 in the shaded jar.
[INFO] Including io.micronaut:micronaut-json-core:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut.sql:micronaut-jdbc:jar:5.5.1 in the shaded jar.
[INFO] Including io.micronaut.flyway:micronaut-flyway:jar:7.1.0 in the shaded jar.
[INFO] Including org.flywaydb:flyway-core:jar:10.6.0 in the shaded jar.
[INFO] Including com.fasterxml.jackson.dataformat:jackson-dataformat-toml:jar:2.16.1 in the shaded jar.
[INFO] Including com.google.code.gson:gson:jar:2.10.1 in the shaded jar.
[INFO] Including io.micronaut:micronaut-jackson-databind:jar:4.3.12 in the shaded jar.
[INFO] Including com.fasterxml.jackson.core:jackson-databind:jar:2.16.2 in the shaded jar.
[INFO] Including com.fasterxml.jackson.datatype:jackson-datatype-jdk8:jar:2.16.1 in the shaded jar.
[INFO] Including com.fasterxml.jackson.datatype:jackson-datatype-jsr310:jar:2.16.1 in the shaded jar.
[INFO] Including io.micronaut.micrometer:micronaut-micrometer-core:jar:5.4.0 in the shaded jar.
[INFO] Including io.micrometer:micrometer-core:jar:1.12.2 in the shaded jar.
[INFO] Including io.micrometer:micrometer-commons:jar:1.12.2 in the shaded jar.
[INFO] Including io.micrometer:micrometer-observation:jar:1.12.2 in the shaded jar.
[INFO] Including org.hdrhistogram:HdrHistogram:jar:2.1.12 in the shaded jar.
[INFO] Including org.latencyutils:LatencyUtils:jar:2.0.3 in the shaded jar.
[INFO] Including io.micronaut.serde:micronaut-serde-jackson:jar:2.8.2 in the shaded jar.
[INFO] Including io.micronaut:micronaut-jackson-core:jar:4.3.12 in the shaded jar.
[INFO] Including com.fasterxml.jackson.core:jackson-core:jar:2.16.1 in the shaded jar.
[INFO] Including com.fasterxml.jackson.core:jackson-annotations:jar:2.16.1 in the shaded jar.
[INFO] Including io.micronaut.serde:micronaut-serde-api:jar:2.8.2 in the shaded jar.
[INFO] Including io.micronaut.serde:micronaut-serde-support:jar:2.8.2 in the shaded jar.
[INFO] Including io.micronaut.sql:micronaut-jdbc-hikari:jar:5.5.1 in the shaded jar.
[INFO] Including com.zaxxer:HikariCP:jar:5.1.0 in the shaded jar.
[INFO] Including io.micronaut.validation:micronaut-validation:jar:4.4.4 in the shaded jar.
[INFO] Including io.micronaut:micronaut-core-reactive:jar:4.3.12 in the shaded jar.
[INFO] Including io.micronaut.reactor:micronaut-reactor:jar:3.2.1 in the shaded jar.
[INFO] Including jakarta.validation:jakarta.validation-api:jar:3.0.2 in the shaded jar.
[INFO] Including ch.qos.logback:logback-classic:jar:1.4.14 in the shaded jar.
[INFO] Including ch.qos.logback:logback-core:jar:1.4.14 in the shaded jar.
[INFO] Including com.h2database:h2:jar:2.2.224 in the shaded jar.
[WARNING] jakarta.annotation-api-2.1.1.jar, jakarta.transaction-api-2.0.1.jar define 1 overlapping resource: 
[WARNING]   - META-INF/LICENSE.md
[WARNING] flyway-core-10.6.0.jar, jakarta.inject-api-2.0.1.jar, slf4j-api-2.0.12.jar define 1 overlapping resource: 
[WARNING]   - META-INF/LICENSE.txt
[WARNING] gson-2.10.1.jar, jackson-core-2.16.1.jar, jackson-databind-2.16.2.jar, jackson-dataformat-toml-2.16.1.jar, jackson-datatype-jdk8-2.16.1.jar, jackson-datatype-jsr310-2.16.1.jar, slf4j-api-2.0.12.jar define 1 overlapping classes: 
[WARNING]   - META-INF.versions.9.module-info
[WARNING] HdrHistogram-2.1.12.jar, HikariCP-5.1.0.jar, LatencyUtils-2.0.3.jar, flyway-core-10.6.0.jar, gson-2.10.1.jar, h2-2.2.224.jar, jackson-annotations-2.16.1.jar, jackson-core-2.16.1.jar, jackson-databind-2.16.2.jar, jackson-dataformat-toml-2.16.1.jar, jackson-datatype-jdk8-2.16.1.jar, jackson-datatype-jsr310-2.16.1.jar, jakarta.annotation-api-2.1.1.jar, jakarta.inject-api-2.0.1.jar, jakarta.transaction-api-2.0.1.jar, jakarta.validation-api-3.0.2.jar, logback-classic-1.4.14.jar, logback-core-1.4.14.jar, micrometer-commons-1.12.2.jar, micrometer-core-1.12.2.jar, micrometer-observation-1.12.2.jar, micronaut-aop-4.3.12.jar, micronaut-buffer-netty-4.3.12.jar, micronaut-context-4.3.12.jar, micronaut-context-propagation-4.3.12.jar, micronaut-core-4.3.12.jar, micronaut-core-reactive-4.3.12.jar, micronaut-data-connection-4.6.2.jar, micronaut-data-connection-jdbc-4.6.2.jar, micronaut-data-jdbc-4.6.2.jar, micronaut-data-model-4.6.2.jar, micronaut-data-runtime-4.6.2.jar, micronaut-data-tx-4.6.2.jar, micronaut-data-tx-jdbc-4.6.2.jar, micronaut-discovery-core-4.3.12.jar, micronaut-flyway-7.1.0.jar, micronaut-http-4.3.12.jar, micronaut-http-client-4.3.12.jar, micronaut-http-client-core-4.3.12.jar, micronaut-http-netty-4.3.12.jar, micronaut-http-server-4.3.12.jar, micronaut-http-server-netty-4.3.12.jar, micronaut-inject-4.3.12.jar, micronaut-jackson-core-4.3.12.jar, micronaut-jackson-databind-4.3.12.jar, micronaut-jdbc-5.5.1.jar, micronaut-jdbc-hikari-5.5.1.jar, micronaut-json-core-4.3.12.jar, micronaut-management-4.3.12.jar, micronaut-micrometer-core-5.4.0.jar, micronaut-reactor-3.2.1.jar, micronaut-router-4.3.12.jar, micronaut-serde-api-2.8.2.jar, micronaut-serde-jackson-2.8.2.jar, micronaut-serde-support-2.8.2.jar, micronaut-validation-4.4.4.jar, micronaut-websocket-4.3.12.jar, micronautguide-0.1.jar, netty-buffer-4.1.108.Final.jar, netty-codec-4.1.108.Final.jar, netty-codec-http-4.1.108.Final.jar, netty-codec-http2-4.1.108.Final.jar, netty-codec-socks-4.1.108.Final.jar, netty-common-4.1.108.Final.jar, netty-handler-4.1.108.Final.jar, netty-handler-proxy-4.1.108.Final.jar, netty-resolver-4.1.108.Final.jar, netty-transport-4.1.108.Final.jar, netty-transport-native-unix-common-4.1.108.Final.jar, reactive-streams-1.0.4.jar, reactor-core-3.5.11.jar, slf4j-api-2.0.12.jar define 1 overlapping resource: 
[WARNING]   - META-INF/MANIFEST.MF
[WARNING] micronaut-data-tx-4.6.2.jar, micronaut-data-tx-jdbc-4.6.2.jar define 1 overlapping resource: 
[WARNING]   - META-INF/native-image/io.micronaut.data/data-tx/native-image.properties
[WARNING] jackson-annotations-2.16.1.jar, jackson-core-2.16.1.jar, jackson-databind-2.16.2.jar, jackson-dataformat-toml-2.16.1.jar, jackson-datatype-jdk8-2.16.1.jar, jackson-datatype-jsr310-2.16.1.jar, micrometer-commons-1.12.2.jar, micrometer-core-1.12.2.jar, micrometer-observation-1.12.2.jar define 2 overlapping resources: 
[WARNING]   - META-INF/LICENSE
[WARNING]   - META-INF/NOTICE
[WARNING] netty-buffer-4.1.108.Final.jar, netty-codec-4.1.108.Final.jar, netty-codec-http-4.1.108.Final.jar, netty-codec-http2-4.1.108.Final.jar, netty-codec-socks-4.1.108.Final.jar, netty-common-4.1.108.Final.jar, netty-handler-4.1.108.Final.jar, netty-handler-proxy-4.1.108.Final.jar, netty-resolver-4.1.108.Final.jar, netty-transport-4.1.108.Final.jar, netty-transport-native-unix-common-4.1.108.Final.jar define 1 overlapping resource: 
[WARNING]   - META-INF/io.netty.versions.properties
[WARNING] micronaut-buffer-netty-4.3.12.jar, micronaut-context-4.3.12.jar, micronaut-data-jdbc-4.6.2.jar, micronaut-data-runtime-4.6.2.jar, micronaut-discovery-core-4.3.12.jar, micronaut-flyway-7.1.0.jar, micronaut-http-4.3.12.jar, micronaut-http-client-core-4.3.12.jar, micronaut-http-netty-4.3.12.jar, micronaut-http-server-4.3.12.jar, micronaut-http-server-netty-4.3.12.jar, micronaut-jackson-databind-4.3.12.jar, micronaut-jdbc-hikari-5.5.1.jar, micronaut-management-4.3.12.jar, micronaut-micrometer-core-5.4.0.jar, micronaut-reactor-3.2.1.jar, micronaut-router-4.3.12.jar, micronaut-serde-api-2.8.2.jar, micronaut-serde-jackson-2.8.2.jar, micronaut-validation-4.4.4.jar define 2 overlapping resources: 
[WARNING]   - META-INF/config-properties.adoc
[WARNING]   - META-INF/spring-configuration-metadata.json
[WARNING] jakarta.annotation-api-2.1.1.jar, jakarta.inject-api-2.0.1.jar, jakarta.transaction-api-2.0.1.jar define 1 overlapping resource: 
[WARNING]   - META-INF/NOTICE.md
[WARNING] maven-shade-plugin has detected that some files are
[WARNING] present in two or more JARs. When this happens, only one
[WARNING] single version of the file is copied to the uber jar.
[WARNING] Usually this is not harmful and you can skip these warnings,
[WARNING] otherwise try to manually exclude artifacts based on
[WARNING] mvn dependency:tree -Ddetail=true and the above output.
[WARNING] See https://maven.apache.org/plugins/maven-shade-plugin/
[INFO] Replacing original artifact with shaded artifact.
[INFO] Replacing /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/micronautguide-0.1.jar with /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/micronautguide-0.1-shaded.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  9.503 s
[INFO] Finished at: 2024-03-28T06:46:47+09:00
[INFO] ------------------------------------------------------------------------
[opc@admin2-vm1 micronautguide]$ 
```

#### アプリケーションを実行

```console
[opc@admin2-vm1 micronautguide]$ java -jar target/micronautguide-0.1.jar 
 __  __ _                                  _   
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
06:48:02.901 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
06:48:03.094 [main] INFO  com.zaxxer.hikari.pool.HikariPool - HikariPool-1 - Added connection conn0: url=jdbc:h2:mem:devDb user=SA
06:48:03.096 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
06:48:03.350 [main] INFO  i.m.flyway.AbstractFlywayMigration - Running migrations for database with qualifier [default]
06:48:03.392 [main] INFO  org.flywaydb.core.FlywayExecutor - Database: jdbc:h2:mem:devDb (H2 2.2)
06:48:03.400 [main] WARN  o.f.c.i.database.base.Database - Flyway upgrade recommended: H2 2.2.224 is newer than this version of Flyway and support has not been tested. The latest supported version of H2 is 2.2.220.
06:48:03.411 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Schema history table "PUBLIC"."flyway_schema_history" does not exist yet
06:48:03.413 [main] INFO  o.f.core.internal.command.DbValidate - Successfully validated 0 migrations (execution time 00:00.005s)
06:48:03.413 [main] WARN  o.f.core.internal.command.DbValidate - No migrations found. Are your locations set up correctly?
06:48:03.419 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Creating Schema History table "PUBLIC"."flyway_schema_history" ...
06:48:03.475 [main] INFO  o.f.core.internal.command.DbMigrate - Current version of schema "PUBLIC": << Empty Schema >>
06:48:03.477 [main] INFO  o.f.core.internal.command.DbMigrate - Schema "PUBLIC" is up to date. No migration necessary.
06:48:03.814 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:48:03.815 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:48:03.944 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 1658ms. Server Running: http://admin2-vm1:8080
```

#### `curl http://localhost:8080/health`を実行すると、`{“status”: “UP”, ”checks”: []}` と返却される

別コンソールで`curl http://localhost:8080/health`を実行。アプリケーションに関する各種メトリクスが表示される。

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/health
{"status":"UP"}
[opc@admin2-vm1 ~]$
```

#### `curl http://localhost:8080/metrics`を実行すると、アプリケーションのメトリクス情報が返却される

別コンソールで`curl http://localhost:8080/metrics`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/metrics
{"names":["executor","executor.active","executor.completed","executor.pool.core","executor.pool.max","executor.pool.size","executor.queue.remaining","executor.queued","hikaricp.connections","hikaricp.connections.acquire","hikaricp.connections.active","hikaricp.connections.creation","hikaricp.connections.idle","hikaricp.connections.max","hikaricp.connections.min","hikaricp.connections.pending","hikaricp.connections.timeout","hikaricp.connections.usage","http.server.requests","jvm.buffer.count","jvm.buffer.memory.used","jvm.buffer.total.capacity","jvm.classes.loaded","jvm.classes.unloaded","jvm.gc.concurrent.phase.time","jvm.gc.live.data.size","jvm.gc.max.data.size","jvm.gc.memory.allocated","jvm.gc.memory.promoted","jvm.gc.pause","jvm.memory.committed","jvm.memory.max","jvm.memory.used","jvm.threads.daemon","jvm.threads.live","jvm.threads.peak","jvm.threads.started","jvm.threads.states","logback.events","process.cpu.usage","process.files.max","process.files.open","process.start.time","process.uptime","system.cpu.count","system.cpu.usage","system.load.average.1m"]}
[opc@admin2-vm1 ~]$
```

#### `curl http://localhost:8080/greet`を実行すると、`{“message”: “Hello world”}` と返却される

別コンソールで`curl http://localhost:8080/greet`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/greet
{"message":"Hello World"}
[opc@admin2-vm1 ~]$
```

## 参考サイト

[CREATE AN EXECUTABLE JAR OF A MICRONAUT APPLICATION](https://guides.micronaut.io/latest/executable-jar-gradle-java.html)
