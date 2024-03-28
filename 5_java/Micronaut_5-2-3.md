## 5-2-3 #5-1-1で実装したアプリケーションをコンテナとして実行してください(Micronaut編)

#### Dockerイメージを作成

```console
[opc@admin2-vm1 micronautguide]$ ./mvnw package -Dpackaging=docker-native -Pgraalvm
[INFO] Scanning for projects...
[INFO] 
[INFO] ------------------< example.micronaut:micronautguide >------------------
[INFO] Building micronautguide 0.1
[INFO]   from pom.xml
[INFO] ---------------------------[ docker-native ]----------------------------
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
[INFO] --- native:0.10.1:generateResourceConfig (default-generateResourceConfig) @ micronautguide ---
[INFO] Detected resources for /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/classes are [logback.xml, application.properties, META-INF/micronaut/io.micronaut.inject.BeanDefinitionReference/example.micronaut.$HelloController$Definition$Reference]
[INFO] Resources configuration written into /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/native/generated/generateResourceConfig/resource-config.json
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ micronautguide ---
[INFO] skip non existing resourceDirectory /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/src/test/resources
[INFO] 
[INFO] --- compiler:3.12.1:testCompile (default-testCompile) @ micronautguide ---
[INFO] Nothing to compile - all classes are up to date.
[INFO] 
[INFO] --- native:0.10.1:generateTestResourceConfig (default-generateTestResourceConfig) @ micronautguide ---
[INFO] Detected resources for /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/classes are [logback.xml, application.properties, META-INF/micronaut/io.micronaut.inject.BeanDefinitionReference/example.micronaut.$HelloController$Definition$Reference]
[INFO] Detected resources for /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/src/test/resources are []
[INFO] Resources configuration written into /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/native/generated/generateTestResourceConfig/resource-config.json
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
06:59:19.341 [main] INFO  i.m.c.DefaultApplicationContext$RuntimeConfiguredEnvironment - Established active environments: [test]
06:59:19.542 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
06:59:19.738 [main] INFO  com.zaxxer.hikari.pool.HikariPool - HikariPool-1 - Added connection conn0: url=jdbc:h2:mem:devDb user=SA
06:59:19.740 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
06:59:20.022 [main] INFO  i.m.flyway.AbstractFlywayMigration - Running migrations for database with qualifier [default]
06:59:20.064 [main] INFO  org.flywaydb.core.FlywayExecutor - Database: jdbc:h2:mem:devDb (H2 2.2)
06:59:20.072 [main] WARN  o.f.c.i.database.base.Database - Flyway upgrade recommended: H2 2.2.224 is newer than this version of Flyway and support has not been tested. The latest supported version of H2 is 2.2.220.
06:59:20.084 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Schema history table "PUBLIC"."flyway_schema_history" does not exist yet
06:59:20.085 [main] INFO  o.f.core.internal.command.DbValidate - Successfully validated 0 migrations (execution time 00:00.005s)
06:59:20.086 [main] WARN  o.f.core.internal.command.DbValidate - No migrations found. Are your locations set up correctly?
06:59:20.092 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Creating Schema History table "PUBLIC"."flyway_schema_history" ...
06:59:20.133 [main] INFO  o.f.core.internal.command.DbMigrate - Current version of schema "PUBLIC": << Empty Schema >>
06:59:20.135 [main] INFO  o.f.core.internal.command.DbMigrate - Schema "PUBLIC" is up to date. No migration necessary.
06:59:20.441 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:59:20.442 [main] WARN  i.m.c.i.b.jvm.ExecutorServiceMetrics - Failed to bind as java.util.concurrent.ThreadPerTaskExecutor is unsupported.
06:59:20.620 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Shutdown initiated...
06:59:20.623 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Shutdown completed.
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 1.899 s -- in example.micronaut.MicronautguideTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- mn:4.4.2:aot-analysis (default-aot-analysis) @ micronautguide ---
[INFO] 
[INFO] --- native:0.10.1:write-args-file (default-write-args-file) @ micronautguide ---
[INFO] Downloaded GraalVM reachability metadata repository from file:/home/opc/.m2/repository/org/graalvm/buildtools/graalvm-reachability-metadata/0.10.1/graalvm-reachability-metadata-0.10.1-repository.zip
[WARNING] Properties file at 'jar:file:///home/opc/.m2/repository/io/micronaut/micronaut-aop/4.3.12/micronaut-aop-4.3.12.jar!/META-INF/native-image/io/micronaut/micronaut-aop/native-image.properties' does not match the recommended 'META-INF/native-image/io.micronaut/micronaut-aop/native-image.properties' layout.
[INFO] [graalvm reachability metadata repository for io.netty:netty-codec-http2:4.1.108.Final]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for io.netty:netty-codec-http2:4.1.108.Final]: Configuration directory is io.netty/netty-codec-http2/4.1.80.Final
[INFO] [graalvm reachability metadata repository for io.netty:netty-handler:4.1.108.Final]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for io.netty:netty-handler:4.1.108.Final]: Configuration directory is io.netty/netty-handler/4.1.80.Final
[INFO] [graalvm reachability metadata repository for io.netty:netty-common:4.1.108.Final]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for io.netty:netty-common:4.1.108.Final]: Configuration directory is io.netty/netty-common/4.1.80.Final
[INFO] [graalvm reachability metadata repository for io.netty:netty-buffer:4.1.108.Final]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for io.netty:netty-buffer:4.1.108.Final]: Configuration directory is io.netty/netty-buffer/4.1.80.Final
[INFO] [graalvm reachability metadata repository for io.netty:netty-transport:4.1.108.Final]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for io.netty:netty-transport:4.1.108.Final]: Configuration directory is io.netty/netty-transport/4.1.80.Final
[INFO] [graalvm reachability metadata repository for io.netty:netty-codec-http:4.1.108.Final]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for io.netty:netty-codec-http:4.1.108.Final]: Configuration directory is io.netty/netty-codec-http/4.1.80.Final
[WARNING] Properties file at 'jar:file:///home/opc/.m2/repository/io/micronaut/data/micronaut-data-jdbc/4.6.2/micronaut-data-jdbc-4.6.2.jar!/META-INF/native-image/io.micronaut.data/jdbc/native-image.properties' does not match the recommended 'META-INF/native-image/io.micronaut.data/micronaut-data-jdbc/native-image.properties' layout.
[WARNING] Properties file at 'jar:file:///home/opc/.m2/repository/io/micronaut/data/micronaut-data-model/4.6.2/micronaut-data-model-4.6.2.jar!/META-INF/native-image/io.micronaut.data/data-model/native-image.properties' does not match the recommended 'META-INF/native-image/io.micronaut.data/micronaut-data-model/native-image.properties' layout.
[WARNING] Properties file at 'jar:file:///home/opc/.m2/repository/io/micronaut/data/micronaut-data-tx/4.6.2/micronaut-data-tx-4.6.2.jar!/META-INF/native-image/io.micronaut.data/data-tx/native-image.properties' does not match the recommended 'META-INF/native-image/io.micronaut.data/micronaut-data-tx/native-image.properties' layout.
[WARNING] Properties file at 'jar:file:///home/opc/.m2/repository/io/micronaut/data/micronaut-data-tx-jdbc/4.6.2/micronaut-data-tx-jdbc-4.6.2.jar!/META-INF/native-image/io.micronaut.data/data-tx/native-image.properties' does not match the recommended 'META-INF/native-image/io.micronaut.data/micronaut-data-tx-jdbc/native-image.properties' layout.
[INFO] [graalvm reachability metadata repository for org.flywaydb:flyway-core:10.6.0]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for org.flywaydb:flyway-core:10.6.0]: Configuration directory is org.flywaydb/flyway-core/9.0.1
[INFO] [graalvm reachability metadata repository for com.fasterxml.jackson.core:jackson-databind:2.16.2]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for com.fasterxml.jackson.core:jackson-databind:2.16.2]: Configuration directory is com.fasterxml.jackson.core/jackson-databind/2.15.2
[INFO] [graalvm reachability metadata repository for org.hdrhistogram:HdrHistogram:2.1.12]: Configuration directory is org.hdrhistogram/HdrHistogram/2.1.12
[INFO] [graalvm reachability metadata repository for com.zaxxer:HikariCP:5.1.0]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for com.zaxxer:HikariCP:5.1.0]: Configuration directory is com.zaxxer/HikariCP/5.0.1
[INFO] [graalvm reachability metadata repository for ch.qos.logback:logback-classic:1.4.14]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for ch.qos.logback:logback-classic:1.4.14]: Configuration directory is ch.qos.logback/logback-classic/1.4.9
[INFO] [graalvm reachability metadata repository for com.h2database:h2:2.2.224]: Configuration directory not found. Trying latest version.
[INFO] [graalvm reachability metadata repository for com.h2database:h2:2.2.224]: Configuration directory is com.h2database/h2/2.1.210
[INFO] Args file written to: target/native-image-8828240417570180233.args
[INFO] 
[INFO] --- mn:4.4.2:docker-native (default-docker-native) @ micronautguide ---
[INFO] Exposing port: 8080
[INFO] Using BASE_IMAGE: ghcr.io/graalvm/native-image-community:17-ol9
[INFO] GraalVM native image build args: [--no-fallback, -o, /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide/target/micronautguide, -H:ConfigurationFileDirectories=/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/io.netty/netty-transport/4.1.80.Final,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/io.netty/netty-codec-http/4.1.80.Final,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/io.netty/netty-codec-http2/4.1.80.Final,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/io.netty/netty-handler/4.1.80.Final,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/ch.qos.logback/logback-classic/1.4.9,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/com.fasterxml.jackson.core/jackson-databind/2.15.2,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/io.netty/netty-common/4.1.80.Final,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/org.hdrhistogram/HdrHistogram/2.1.12,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/org.flywaydb/flyway-core/9.0.1,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/com.h2database/h2/2.1.210,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/com.zaxxer/HikariCP/5.0.1,/home/app/graalvm-reachability-metadata/76959c24b4bf10526a1fa23e9a814b7951d7d546/io.netty/netty-buffer/4.1.80.Final, --no-fallback, --exclude-config, \Q/home/app/libs/netty-codec-http2-4.1.108.Final.jar\E, ^/META-INF/native-image/, --exclude-config, \Q/home/app/libs/netty-handler-4.1.108.Final.jar\E, ^/META-INF/native-image/, --exclude-config, \Q/home/app/libs/netty-common-4.1.108.Final.jar\E, ^/META-INF/native-image/, --exclude-config, \Q/home/app/libs/netty-buffer-4.1.108.Final.jar\E, ^/META-INF/native-image/, --exclude-config, \Q/home/app/libs/netty-transport-4.1.108.Final.jar\E, ^/META-INF/native-image/, --exclude-config, \Q/home/app/libs/netty-codec-http-4.1.108.Final.jar\E, ^/META-INF/native-image/, -H:ConfigurationFileDirectories=/home/app/generateResourceConfig,/home/app/generateTestResourceConfig]
[INFO] Using BASE_IMAGE_RUN: cgr.dev/chainguard/wolfi-base:latest
[INFO] Using CLASS_NAME: example.micronaut.Application
[INFO] Step 1/16 : ARG BASE_IMAGE
[INFO] 
[INFO] Step 2/16 : ARG BASE_IMAGE_RUN
[INFO] 
[INFO] Step 3/16 : FROM ${BASE_IMAGE} AS builder
[INFO] 
[INFO]  ---> d4837dfb86a3
[INFO] Step 4/16 : WORKDIR /home/app
[INFO] 
[INFO]  ---> Running in 167624b673a9
[INFO] Removing intermediate container 167624b673a9
[INFO]  ---> aa95253193f2
[INFO] Step 5/16 : COPY classes /home/app/classes
[INFO] 
[INFO]  ---> bbdf92a03563
[INFO] Step 6/16 : COPY dependency/* /home/app/libs/
[INFO] 
[INFO]  ---> d3fdf8049f6e
[INFO] Step 7/16 : COPY graalvm-reachability-metadat[a] /home/app/graalvm-reachability-metadata
[INFO] 
[INFO]  ---> 755ed5fb9170
[INFO] Step 8/16 : COPY nativ[e]/generated /home/app/
[INFO] 
[INFO]  ---> 1373b1fa8480
[INFO] Step 9/16 : COPY *.args /home/app/graalvm-native-image.args
[INFO] 
[INFO]  ---> faca6dd72884
[INFO] Step 10/16 : ARG CLASS_NAME
[INFO] 
[INFO]  ---> Running in 9f825135e52d
[INFO] Removing intermediate container 9f825135e52d
[INFO]  ---> aebee42cbbc2
[INFO] Step 11/16 : RUN native-image @/home/app/graalvm-native-image.args -H:Class=${CLASS_NAME} -H:Name=application -cp "/home/app/libs/*:/home/app/classes/"
[INFO] 
[INFO]  ---> Running in 375610fd326c
[INFO] ========================================================================================================================
[INFO] GraalVM Native Image: Generating '
[INFO] application' (
[INFO] executable)...
========================================================================================================================
[INFO] 
For detailed information and explanations on the build output, visit:
https://github.com/oracle/graal/blob/master/docs/reference-manual/native-image/BuildOutput.md
------------------------------------------------------------------------------------------------------------------------
[INFO] Warning: Could not resolve class com.github.luben.zstd.ZstdCompressCtx for reflection configuration. Reason: java.lang.ClassNotFoundException: com.github.luben.zstd.ZstdCompressCtx.

[INFO] Warning: Could not resolve class io.netty.handler.ssl.OpenSslClientSessionCache for reflection configuration. Reason: java.lang.NoClassDefFoundError: io/netty/internal/tcnative/SSLSessionCache.
Warning: Could not resolve class io.netty.handler.ssl.ReferenceCountedOpenSslClientContext$ExtendedTrustManagerVerifyCallback for reflection configuration. Reason: java.lang.NoClassDefFoundError: io/netty/internal/tcnative/CertificateVerifier.
Warning: Could not resolve class io.netty.handler.ssl.ReferenceCountedOpenSslServerContext$ExtendedTrustManagerVerifyCallback for reflection configuration. Reason: java.lang.NoClassDefFoundError: io/netty/internal/tcnative/CertificateVerifier.
Warning: Could not resolve class io.netty.handler.ssl.ReferenceCountedOpenSslServerContext$OpenSslServerCertificateCallback for reflection configuration. Reason: java.lang.NoClassDefFoundError: io/netty/internal/tcnative/CertificateCallback.

[INFO] Warning: Could not resolve class org.conscrypt.ConscryptEngine for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.ConscryptEngine.

[INFO] Warning: Could not resolve class org.conscrypt.ConscryptEngine for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.ConscryptEngine.

[INFO] Warning: Could not resolve class org.conscrypt.ConscryptEngine for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.ConscryptEngine.

[INFO] Warning: Could not resolve class io.netty.resolver.dns.macos.DnsResolver for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.resolver.dns.macos.DnsResolver.

[INFO] Warning: Could not resolve class io.netty.resolver.dns.macos.MacOSDnsServerAddressStreamProvider for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.resolver.dns.macos.MacOSDnsServerAddressStreamProvider.

[INFO] Warning: Could not resolve class io.netty.channel.kqueue.BsdSocket for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.BsdSocket.
Warning: Could not resolve class io.netty.channel.kqueue.KQueueEventArray for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.KQueueEventArray.

[INFO] Warning: Could not resolve class io.netty.channel.kqueue.KQueueStaticallyReferencedJniMethods for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.KQueueStaticallyReferencedJniMethods.
Warning: Could not resolve class io.netty.channel.kqueue.Native for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.Native.

[INFO] Warning: Method ch.qos.logback.core.FileAppender.valueOf(String) not found.

[INFO] Warning: Method ch.qos.logback.core.Layout.valueOf(String) not found.

[INFO] Warning: Method ch.qos.logback.core.rolling.RollingPolicy.valueOf(String) not found.

[INFO] Warning: Method ch.qos.logback.core.rolling.TriggeringPolicy.valueOf(String) not found.

[INFO] Warning: Method ch.qos.logback.core.spi.ContextAware.valueOf(String) not found.

[INFO] Warning: Method ch.qos.logback.core.encoder.LayoutWrappingEncoder.setParent(Appender) not found.

[INFO] Warning: Could not resolve class com.aayushatharva.brotli4j.Brotli4jLoader for reflection configuration. Reason: java.lang.ClassNotFoundException: com.aayushatharva.brotli4j.Brotli4jLoader.

[INFO] Warning: Could not resolve class com.github.luben.zstd.Zstd for reflection configuration. Reason: java.lang.ClassNotFoundException: com.github.luben.zstd.Zstd.

[INFO] Warning: Could not resolve class com.ning.compress.lzf.impl.UnsafeChunkDecoder for reflection configuration. Reason: java.lang.ClassNotFoundException: com.ning.compress.lzf.impl.UnsafeChunkDecoder.

[INFO] Warning: Could not resolve class io.netty.channel.epoll.EpollSocketChannel for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.epoll.EpollSocketChannel.

[INFO] Warning: Method java.nio.DirectByteBuffer.<init>(long, long) not found.

[INFO] Warning: Method java.nio.DirectByteBuffer.<init>(long, long) not found.

[INFO] Warning: Could not resolve class org.apache.commons.logging.LogFactory for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.LogFactory.

[INFO] Warning: Could not resolve class org.apache.commons.logging.impl.Log4JLogger for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.impl.Log4JLogger.

[INFO] Warning: Could not resolve class org.apache.commons.logging.impl.LogFactoryImpl for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.impl.LogFactoryImpl.

[INFO] Warning: Could not resolve class org.apache.commons.logging.impl.WeakHashtable for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.impl.WeakHashtable.
Warning: Could not resolve class org.apache.log4j.Level for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.log4j.Level.

[INFO] Warning: Could not resolve class org.apache.log4j.Priority for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.log4j.Priority.

[INFO] Warning: Could not resolve class org.conscrypt.Conscrypt for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.Conscrypt.

[INFO] Warning: Could not resolve class org.conscrypt.OpenSSLContextImpl$TLSv13 for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.OpenSSLContextImpl$TLSv13.

[INFO] Warning: Could not resolve class org.hamcrest.number.OrderingComparison for reflection configuration. Reason: java.lang.ClassNotFoundException: org.hamcrest.number.OrderingComparison.

[INFO] Warning: Method com.zaxxer.hikari.HikariConfig.getScheduledExecutorService() not found.

[INFO] Warning: Method com.zaxxer.hikari.HikariConfig.isInitializationFailFast() not found.

[INFO] Warning: Method com.zaxxer.hikari.HikariConfig.isJdbc4ConnectionTest() not found.

[INFO] Warning: Method com.zaxxer.hikari.HikariConfig.setInitializationFailFast(boolean) not found.

[INFO] Warning: Method com.zaxxer.hikari.HikariConfig.setJdbc4ConnectionTest(boolean) not found.

[INFO] Warning: Method com.zaxxer.hikari.HikariConfig.setScheduledExecutorService(ScheduledThreadPoolExecutor) not found.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.createIndex(Connection, String, String, String) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.dropAll(Connection) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.dropIndex(Connection, String, String) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.init(Connection) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.reindex(Connection) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.search(Connection, String, int, int) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene.searchData(Connection, String, int, int) for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexFormatTooOldException.

[INFO] Warning: Could not register method org.h2.fulltext.FullTextLucene$FullTextTrigger.<init>() for reflection. Reason: java.lang.NoClassDefFoundError: org/apache/lucene/index/IndexableFieldType.

[INFO] [1/8] Initializing...                                                                                    (7.5s @ 0.20GB)
[INFO]  Java version: 17.0.9+9, vendor version: GraalVM CE 17.0.9+9.1
[INFO]  
[INFO] Graal compiler
[INFO] : optimization level: 2, target machine: x86-64-v3
[INFO]  C compiler: gcc (redhat, x86_64, 11.3.1)
 Garbage collector: Serial GC (
[INFO] max heap size: 80% of RAM)
[INFO]  4 user-specific feature(s)
[INFO] 
 - com.oracle.svm.thirdparty.gson.GsonFeature
 - io.micronaut.core.io.service.ServiceLoaderFeature
 - io.micronaut.flyway.StaticResourceFeature
 - io.micronaut.jackson.JacksonDatabindFeature
[INFO] [2/8] Performing analysis...  [********]                                                               (108.9s @ 1.69GB)
[INFO] 
[INFO]   22,514 (91.28%) of 24,666 types reachable
[INFO]   36,795 (65.09%) of 56,527 fields reachable
[INFO]  115,370 (64.21%) of 179,686 methods reachable
[INFO]    7,109 types,   638 fields, and 5,821 methods registered for reflection
      69 types,    74 fields, and    59 methods registered for JNI access
       4 native libraries: dl, pthread, rt, z
[INFO] [3/8] Building universe...                                                                              (11.7s @ 2.04GB)
[INFO] [4/8] Parsing methods...
[INFO]       [***]                                                                     (10.4s @ 2.41GB)
[INFO] [5/8] 
[INFO] Inlining methods
[INFO] ...
[INFO]      [*
[INFO] *
[INFO] *]                                                                      (5.6s @ 2.41GB)
[INFO] 
[INFO] [6/8] Compiling methods...    [*********]
[INFO]                                                                (81.8s @ 1.61GB)
[INFO] [7/8] Layouting methods...    [***]                                                                      (9.5s @ 2.18GB)
[INFO] [8/8] Creating image...       [***]                                                                     (10.2s @ 2.17GB)
[INFO] 
  54.27MB (54.52%) for code area:    76,913 compilation units
  44.91MB (45.11%) for image heap:  477,365 objects and 794 resources
 375.16kB ( 0.37%) for other data
  99.55MB in total
------------------------------------------------------------------------------------------------------------------------
Top 10 origins of code area:                                Top 10 object types in image heap:
  13.59MB java.base                                           11.68MB byte[] for code metadata
   5.79MB h2-2.2.224.jar                                       6.89MB java.lang.Class
   3.71MB java.xml                                             4.47MB java.lang.String
   2.16MB jackson-databind-2.16.2.jar                          4.29MB byte[] for java.lang.String
   1.64MB svm.jar (Native Image)                               3.52MB byte[] for general heap data
   1.54MB java.desktop                                         1.89MB com.oracle.svm.core.hub.DynamicHubCompanion
   1.19MB micronaut-data-model-4.6.2.jar                       1.45MB byte[] for embedded resources
   1.15MB flyway-core-10.6.0.jar                               1.30MB byte[] for reflection metadata
   1.06MB micronaut-data-runtime-4.6.2.jar                   910.59kB java.lang.String[]
   1.05MB micronaut-inject-4.3.12.jar                        819.69kB c.o.svm.core.hub.DynamicHub$ReflectionMetadata
  20.86MB for 90 more packages                                 7.46MB for 4178 more object types
------------------------------------------------------------------------------------------------------------------------
Recommendations:
 AWT:  Use the tracing agent to collect metadata for AWT.
 HEAP: Set max heap for improved and more predictable memory usage.
 CPU:  Enable more CPU features with '-march=native' for improved performance.
[INFO] ------------------------------------------------------------------------------------------------------------------------
[INFO]                        29.2s (11.7% of total time) in 173 GCs | Peak RSS: 3.87GB | CPU load: 3.43
[INFO] ------------------------------------------------------------------------------------------------------------------------
Produced artifacts:
[INFO]  
[INFO] /home/app/application
[INFO]  (executable)
 /home/app/libawt.so (jdk_library)
 /home/app/libawt_headless.so (jdk_library)
 /home/app/libawt_xawt.so (jdk_library)
 /home/app/libfontmanager.so (jdk_library)
 /home/app/libjava.so (jdk_library_shim)
 /home/app/libjavajpeg.so (jdk_library)
 /home/app/libjvm.so (jdk_library_shim)
 /home/app/liblcms.so (jdk_library)
========================================================================================================================
Finished generating 'application' in 4m 7s.
[INFO] Removing intermediate container 375610fd326c
[INFO]  ---> 704b8c426d38
[INFO] Step 12/16 : FROM ${BASE_IMAGE_RUN}
[INFO] 
[INFO]  ---> d3e4469aaa37
[INFO] Step 13/16 : COPY --from=builder /home/app/application /app/application
[INFO] 
[INFO]  ---> fd7aebfc7f23
[INFO] Step 14/16 : ARG PORT=8080
[INFO] 
[INFO]  ---> Running in 255560c66e45
[INFO] Removing intermediate container 255560c66e45
[INFO]  ---> 1f2445a55590
[INFO] Step 15/16 : EXPOSE ${PORT}
[INFO] 
[INFO]  ---> Running in a2166da64673
[INFO] Removing intermediate container a2166da64673
[INFO]  ---> c3e3242ae553
[INFO] Step 16/16 : ENTRYPOINT ["/app/application"]
[INFO] 
[INFO]  ---> Running in e232ba752386
[INFO] Removing intermediate container e232ba752386
[INFO]  ---> bdc9a2475db0
[INFO] Successfully built bdc9a2475db0
[INFO] Successfully tagged micronautguide:latest
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  05:20 min
[INFO] Finished at: 2024-03-28T07:04:37+09:00
[INFO] ------------------------------------------------------------------------
[opc@admin2-vm1 micronautguide]$ 
[opc@admin2-vm1 micronautguide]$ docker images
REPOSITORY                               TAG       IMAGE ID       CREATED         SIZE
micronautguide                           latest    bdc9a2475db0   7 minutes ago   137MB
<none>                                   <none>    704b8c426d38   7 minutes ago   1.2GB
cgr.dev/chainguard/wolfi-base            latest    d3e4469aaa37   6 hours ago     32.8MB
ghcr.io/graalvm/native-image-community   17-ol9    d4837dfb86a3   5 months ago    1.07GB
```

#### 作成したイメージを実行する。コンテナ側のポート8080に対し、今回はローカルのポートは6060としてみる。

```console
[opc@admin2-vm1 micronautguide]$ docker run --name micronautguide -p 6060:8080 micronautguide:latest
 __  __ _                                  _   
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
22:13:05.007 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
22:13:05.009 [main] INFO  com.zaxxer.hikari.pool.HikariPool - HikariPool-1 - Added connection conn0: url=jdbc:h2:mem:devDb user=SA
22:13:05.010 [main] INFO  com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
22:13:05.016 [main] INFO  i.m.flyway.AbstractFlywayMigration - Running migrations for database with qualifier [default]
22:13:05.017 [main] INFO  org.flywaydb.core.FlywayExecutor - Database: jdbc:h2:mem:devDb (H2 2.2)
22:13:05.017 [main] WARN  o.f.c.i.database.base.Database - Flyway upgrade recommended: H2 2.2.224 is newer than this version of Flyway and support has not been tested. The latest supported version of H2 is 2.2.220.
22:13:05.017 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Schema history table "PUBLIC"."flyway_schema_history" does not exist yet
22:13:05.017 [main] INFO  o.f.core.internal.command.DbValidate - Successfully validated 0 migrations (execution time 00:00.000s)
22:13:05.017 [main] WARN  o.f.core.internal.command.DbValidate - No migrations found. Are your locations set up correctly?
22:13:05.018 [main] INFO  o.f.c.i.s.JdbcTableSchemaHistory - Creating Schema History table "PUBLIC"."flyway_schema_history" ...
22:13:05.019 [main] INFO  o.f.core.internal.command.DbMigrate - Current version of schema "PUBLIC": << Empty Schema >>
22:13:05.019 [main] INFO  o.f.core.internal.command.DbMigrate - Schema "PUBLIC" is up to date. No migration necessary.
22:13:05.033 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 33ms. Server Running: http://c7088c7cc45a:8080

```

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:6060/xxxxx`を実行（詳細は省略）

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/greet
{"message":"Hello World"}
[opc@admin2-vm1 ~]$
[opc@admin2-vm1 ~]$ curl http://localhost:6060/health
{"status":"UP"}
[opc@admin2-vm1 ~]$
[opc@admin2-vm1 ~]$ curl http://localhost:6060/metrics
{"names":["executor","executor.active","executor.completed","executor.pool.core","executor.pool.max","executor.pool.size","executor.queue.remaining","executor.queued","hikaricp.connections","hikaricp.connections.acquire","hikaricp.connections.active","hikaricp.connections.creation","hikaricp.connections.idle","hikaricp.connections.max","hikaricp.connections.min","hikaricp.connections.pending","hikaricp.connections.timeout","hikaricp.connections.usage","http.server.requests","jvm.classes.loaded","jvm.classes.unloaded","jvm.gc.live.data.size","jvm.gc.max.data.size","jvm.gc.memory.allocated","jvm.gc.memory.promoted","jvm.memory.committed","jvm.memory.max","jvm.memory.used","jvm.threads.daemon","jvm.threads.live","jvm.threads.peak","jvm.threads.started","jvm.threads.states","logback.events","process.cpu.usage","process.files.max","process.files.open","process.start.time","process.uptime","system.cpu.count","system.cpu.usage","system.load.average.1m"]}
[opc@admin2-vm1 ~]$
```

## 参考サイト

- [Micronaut build plugins offer several ways to build Docker images - JAR, GraalVM native executable, CRaC](https://guides.micronaut.io/latest/micronaut-docker-image-maven-java.html)
