## 5-2-3 #5-1-1で実装したアプリケーションをコンテナとして実行してください

### 参考サイト

[GraalVM Tools for Micronaut](https://docs.oracle.com/cd/F44923_01/enterprise/22/docs/tools/vscode/micronaut-extension/#extension-settings)

#### 1. Native Imageを作成

```console
[opc@admin2-vm1 micronautguide_gradle]$ ./gradlew dockerBuildNative

> Task :generateResourcesConfigFile
[native-image-plugin] Resources configuration written into /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide_gradle/build/native/generated/generateResourcesConfigFile/
resource-config.json                                                                                                                                                                      
> Task :dockerfileNative
Dockerfile written to: /home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide_gradle/build/docker/native-main/DockerfileNative

> Task :dockerBuildNative
Building image using context '/home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide_gradle/build/docker/native-main'.
Using Dockerfile '/home/opc/cn-study_public/5-2-Java_Standard_Micronout/micronautguide_gradle/build/docker/native-main/DockerfileNative'
Using images 'micronautguide_gradle'.
Step 1/17 : FROM ghcr.io/graalvm/native-image-community:17-ol9 AS graalvm
 ---> d4837dfb86a3
Step 2/17 : WORKDIR /home/app
 ---> Running in 8b554d12659d
Removing intermediate container 8b554d12659d
 ---> 9085b5c00f82
Step 3/17 : COPY --link layers/libs /home/app/libs
 ---> ad50723a050a
Step 4/17 : COPY --link layers/app /home/app/
 ---> c0a74f102f58
Step 5/17 : COPY --link layers/resources /home/app/resources
 ---> 80e152c8ce2a
Step 6/17 : RUN mkdir /home/app/config-dirs
 ---> Running in 0c931b35f121
Removing intermediate container 0c931b35f121
 ---> fbbf9485b734
Step 7/17 : RUN mkdir -p /home/app/config-dirs/generateResourcesConfigFile
 ---> Running in 8030fbb311e6
Removing intermediate container 8030fbb311e6
 ---> 116bda6bbe8c
Step 8/17 : RUN mkdir -p /home/app/config-dirs/io.netty/netty-common/4.1.80.Final
 ---> Running in 7eac581c6b10
Removing intermediate container 7eac581c6b10
 ---> 886af9dc2b3d
Step 9/17 : RUN mkdir -p /home/app/config-dirs/ch.qos.logback/logback-classic/1.4.9
 ---> Running in 5549f40eaf66
Removing intermediate container 5549f40eaf66
 ---> 08d96fffb613
Step 10/17 : COPY --link config-dirs/generateResourcesConfigFile /home/app/config-dirs/generateResourcesConfigFile
 ---> b00eae90a225
Step 11/17 : COPY --link config-dirs/io.netty/netty-common/4.1.80.Final /home/app/config-dirs/io.netty/netty-common/4.1.80.Final
 ---> 24b82dee603f
Step 12/17 : COPY --link config-dirs/ch.qos.logback/logback-classic/1.4.9 /home/app/config-dirs/ch.qos.logback/logback-classic/1.4.9
 ---> 78bdc438db58
Step 13/17 : RUN native-image --exclude-config .*/libs/netty-codec-http2-4.1.108.Final.jar ^/META-INF/native-image/.* --exclude-config .*/libs/netty-handler-4.1.108.Final.jar ^/META-INF/
native-image/.* --exclude-config .*/libs/netty-buffer-4.1.108.Final.jar ^/META-INF/native-image/.* --exclude-config .*/libs/netty-common-4.1.108.Final.jar ^/META-INF/native-image/.* --exclude-config .*/libs/netty-transport-4.1.108.Final.jar ^/META-INF/native-image/.* --exclude-config .*/libs/netty-codec-http-4.1.108.Final.jar ^/META-INF/native-image/.* -cp /home/app/libs/*.jar:/home/app/resources:/home/app/application.jar --no-fallback -o application -H:ConfigurationFileDirectories=/home/app/config-dirs/generateResourcesConfigFile,/home/app/config-dirs/io.netty/netty-codec-http/4.1.80.Final,/home/app/config-dirs/io.netty/netty-common/4.1.80.Final,/home/app/config-dirs/io.netty/netty-buffer/4.1.80.Final,/home/app/config-dirs/io.netty/netty-transport/4.1.80.Final,/home/app/config-dirs/io.netty/netty-handler/4.1.80.Final,/home/app/config-dirs/io.netty/netty-codec-http2/4.1.80.Final,/home/app/config-dirs/ch.qos.logback/logback-classic/1.4.9 example.micronaut.Application                                                                                                                                         ---> Running in dc8db7a36fa3
========================================================================================================================
GraalVM Native Image: Generating 'application' (executable)...
========================================================================================================================
For detailed information and explanations on the build output, visit:
https://github.com/oracle/graal/blob/master/docs/reference-manual/native-image/BuildOutput.md
------------------------------------------------------------------------------------------------------------------------
Warning: Could not resolve class com.github.luben.zstd.ZstdCompressCtx for reflection configuration. Reason: java.lang.ClassNotFoundException: com.github.luben.zstd.ZstdCompressCtx.
Warning: Could not resolve class io.netty.handler.ssl.OpenSslClientSessionCache for reflection configuration. Reason: java.lang.NoClassDefFoundError: io/netty/internal/tcnative/SSLSessio
nCache.                                                                                                                                                                                   Warning: Could not resolve class io.netty.handler.ssl.ReferenceCountedOpenSslClientContext$ExtendedTrustManagerVerifyCallback for reflection configuration. Reason: java.lang.NoClassDefFo
undError: io/netty/internal/tcnative/CertificateVerifier.                                                                                                                                 Warning: Could not resolve class io.netty.handler.ssl.ReferenceCountedOpenSslServerContext$ExtendedTrustManagerVerifyCallback for reflection configuration. Reason: java.lang.NoClassDefFo
undError: io/netty/internal/tcnative/CertificateVerifier.                                                                                                                                 Warning: Could not resolve class io.netty.handler.ssl.ReferenceCountedOpenSslServerContext$OpenSslServerCertificateCallback for reflection configuration. Reason: java.lang.NoClassDefFoun
dError: io/netty/internal/tcnative/CertificateCallback.                                                                                                                                   Warning: Could not resolve class org.conscrypt.ConscryptEngine for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.ConscryptEngine.
Warning: Could not resolve class org.conscrypt.ConscryptEngine for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.ConscryptEngine.
Warning: Could not resolve class org.conscrypt.ConscryptEngine for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.ConscryptEngine.
Warning: Could not resolve class io.netty.resolver.dns.macos.DnsResolver for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.resolver.dns.macos.DnsResolver.
Warning: Could not resolve class io.netty.resolver.dns.macos.MacOSDnsServerAddressStreamProvider for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.resolver
.dns.macos.MacOSDnsServerAddressStreamProvider.                                                                                                                                           Warning: Could not resolve class io.netty.channel.kqueue.BsdSocket for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.BsdSocket.
Warning: Could not resolve class io.netty.channel.kqueue.KQueueEventArray for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.KQueueEventArray
.                                                                                                                                                                                         Warning: Could not resolve class io.netty.channel.kqueue.KQueueStaticallyReferencedJniMethods for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqu
eue.KQueueStaticallyReferencedJniMethods.                                                                                                                                                 Warning: Could not resolve class io.netty.channel.kqueue.Native for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.kqueue.Native.
Warning: Method ch.qos.logback.core.encoder.LayoutWrappingEncoder.setParent(Appender) not found.
Warning: Could not resolve class com.aayushatharva.brotli4j.Brotli4jLoader for reflection configuration. Reason: java.lang.ClassNotFoundException: com.aayushatharva.brotli4j.Brotli4jLoad
er.                                                                                                                                                                                       Warning: Could not resolve class com.github.luben.zstd.Zstd for reflection configuration. Reason: java.lang.ClassNotFoundException: com.github.luben.zstd.Zstd.
Warning: Could not resolve class com.ning.compress.lzf.impl.UnsafeChunkDecoder for reflection configuration. Reason: java.lang.ClassNotFoundException: com.ning.compress.lzf.impl.UnsafeCh
unkDecoder.                                                                                                                                                                               Warning: Could not resolve class io.netty.channel.epoll.EpollSocketChannel for reflection configuration. Reason: java.lang.ClassNotFoundException: io.netty.channel.epoll.EpollSocketChann
el.                                                                                                                                                                                       Warning: Method java.nio.DirectByteBuffer.<init>(long, long) not found.
Warning: Method java.nio.DirectByteBuffer.<init>(long, long) not found.
Warning: Could not resolve class org.apache.commons.logging.LogFactory for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.LogFactory.
Warning: Could not resolve class org.apache.commons.logging.impl.Log4JLogger for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.impl.Log4J
Logger.                                                                                                                                                                                   Warning: Could not resolve class org.apache.commons.logging.impl.LogFactoryImpl for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.impl.Lo
gFactoryImpl.                                                                                                                                                                             Warning: Could not resolve class org.apache.commons.logging.impl.WeakHashtable for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.commons.logging.impl.Wea
kHashtable.                                                                                                                                                                               Warning: Could not resolve class org.apache.log4j.Level for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.log4j.Level.
Warning: Could not resolve class org.apache.log4j.Priority for reflection configuration. Reason: java.lang.ClassNotFoundException: org.apache.log4j.Priority.
Warning: Could not resolve class org.conscrypt.Conscrypt for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.Conscrypt.
Warning: Could not resolve class org.conscrypt.OpenSSLContextImpl$TLSv13 for reflection configuration. Reason: java.lang.ClassNotFoundException: org.conscrypt.OpenSSLContextImpl$TLSv13.
Warning: Could not resolve class org.hamcrest.number.OrderingComparison for reflection configuration. Reason: java.lang.ClassNotFoundException: org.hamcrest.number.OrderingComparison.
Warning: Method ch.qos.logback.core.FileAppender.valueOf(String) not found.
Warning: Method ch.qos.logback.core.Layout.valueOf(String) not found.
Warning: Method ch.qos.logback.core.rolling.RollingPolicy.valueOf(String) not found.
Warning: Method ch.qos.logback.core.rolling.TriggeringPolicy.valueOf(String) not found.
Warning: Method ch.qos.logback.core.spi.ContextAware.valueOf(String) not found.
Warning: Could not resolve class reactor.core.publisher.Traces$StackWalkerCallSiteSupplierFactory for reflection configuration. Reason: java.lang.ClassNotFoundException: reactor.core.pub
lisher.Traces$StackWalkerCallSiteSupplierFactory.                                                                                                                                         Warning: Could not resolve class reactor.core.publisher.Traces$ExceptionCallSiteSupplierFactory for reflection configuration. Reason: java.lang.ClassNotFoundException: reactor.core.publi
sher.Traces$ExceptionCallSiteSupplierFactory.                                                                                                                                             [1/8] Initializing...                                                                                   (19.8s @ 0.13GB)
 Java version: 17.0.9+9, vendor version: GraalVM CE 17.0.9+9.1
 Graal compiler: optimization level: 2, target machine: x86-64-v3
 C compiler: gcc (redhat, x86_64, 11.3.1)
 Garbage collector: Serial GC (max heap size: 80% of RAM)
 1 user-specific feature(s)
 - io.micronaut.core.io.service.ServiceLoaderFeature
[2/8] Performing analysis...  [*******]                                                                (153.8s @ 1.11GB)
  13,414 (89.90%) of 14,921 types reachable
  20,566 (60.43%) of 34,031 fields reachable
  67,028 (62.28%) of 107,624 methods reachable
   4,416 types,   467 fields, and 4,266 methods registered for reflection
      66 types,    70 fields, and    57 methods registered for JNI access
       4 native libraries: dl, pthread, rt, z
[3/8] Building universe...                                                                              (18.3s @ 1.16GB)
[4/8] Parsing methods...      [****]                                                                    (12.0s @ 1.31GB)
[5/8] Inlining methods...     [***]                                                                      (9.5s @ 0.81GB)
[6/8] Compiling methods...    [**********]                                                             (103.7s @ 1.14GB)
[7/8] Layouting methods...    [***]                                                                      (8.4s @ 1.24GB)
[8/8] Creating image...       [***]                                                                      (8.7s @ 1.28GB)
  30.80MB (52.86%) for code area:    45,202 compilation units
  27.13MB (46.57%) for image heap:  314,201 objects and 265 resources
 340.08kB ( 0.57%) for other data
  58.26MB in total
------------------------------------------------------------------------------------------------------------------------
Top 10 origins of code area:                                Top 10 object types in image heap:
  12.52MB java.base                                            6.67MB byte[] for code metadata
   2.90MB java.xml                                             3.73MB java.lang.Class
   1.40MB svm.jar (Native Image)                               2.87MB java.lang.String
1004.27kB micronaut-inject-4.3.12.jar                          2.60MB byte[] for java.lang.String
 871.98kB micronaut-serde-support-2.8.2.jar                    2.51MB byte[] for general heap data
 867.22kB reactor-core-3.6.1.jar                               1.13MB com.oracle.svm.core.hub.DynamicHubCompanion
 835.96kB micronaut-http-4.3.12.jar                          809.62kB byte[] for reflection metadata
 750.58kB micronaut-http-server-netty-4.3.12.jar             578.10kB java.lang.String[]
 733.47kB logback-core-1.4.14.jar                            521.44kB java.util.HashMap$Node
 625.66kB netty-codec-http2-4.1.108.Final.jar                514.02kB int[][]
   8.10MB for 49 more packages                                 5.02MB for 2863 more object types
------------------------------------------------------------------------------------------------------------------------
Recommendations:
 HEAP: Set max heap for improved and more predictable memory usage.
 CPU:  Enable more CPU features with '-march=native' for improved performance.
------------------------------------------------------------------------------------------------------------------------
                       40.4s (12.0% of total time) in 222 GCs | Peak RSS: 2.06GB | CPU load: 1.63
------------------------------------------------------------------------------------------------------------------------
Produced artifacts:
 /home/app/application (executable)
========================================================================================================================
Finished generating 'application' in 5m 36s.
Removing intermediate container dc8db7a36fa3
 ---> 16ad6a910e28
Step 14/17 : FROM cgr.dev/chainguard/wolfi-base:latest
 ---> feaa0af6dac3
Step 15/17 : EXPOSE 8080
 ---> Running in 6209405eead4
Removing intermediate container 6209405eead4
 ---> bac459c80320
Step 16/17 : COPY --link --from=graalvm /home/app/application /app/application
 ---> 0664cc1d7658
Step 17/17 : ENTRYPOINT ["/app/application"]
 ---> Running in 6cc61c3bff02
Removing intermediate container 6cc61c3bff02
 ---> fc41f1856685
Successfully built fc41f1856685
Successfully tagged micronautguide_gradle:latest
Created image with ID 'fc41f1856685'.

BUILD SUCCESSFUL in 7m 20s
9 actionable tasks: 6 executed, 3 up-to-date

```

イメージビルド時のCPUの消費が大きい・・・

`top`コマンドの実行結果

```console
top - 06:28:11 up 55 days, 13:05,  0 users,  load average: 3.88, 3.09, 1.81
Tasks: 405 total,   1 running, 404 sleeping,   0 stopped,   0 zombie
%Cpu(s): 96.7 us,  2.7 sy,  0.2 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.2 si,  0.3 st
MiB Mem :   7481.1 total,    124.4 free,   6726.6 used,    995.8 buff/cache
MiB Swap:   4096.0 total,    554.3 free,   3541.7 used.    754.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                                                            
 619974 root      20   0 4749628   1.8g  35992 S 187.5  25.0   8:03.23 java                                                                                                               
 613279 opc       20   0  987120  60112  18392 S   1.7   0.8   0:21.48 node                                                                                                               
   6206 opc       20   0 4064392 158376  28904 S   1.0   2.1 430:15.70 gnome-shell                                                                                                        
 613397 opc       20   0  754912  41920  16804 S   1.0   0.5   0:02.96 node                                                                                                               
1830004 opc       20   0 4537004 499752   4380 S   1.0   6.5 460:15.69 java                     
```

##### Dockerイメージの確認

```console
[opc@admin2-vm1 micronautguide_gradle]$ docker images
REPOSITORY                               TAG            IMAGE ID       CREATED          SIZE
micronautguide_gradle                    latest         fc41f1856685   45 seconds ago   76.7MB
<none>                                   <none>         16ad6a910e28   51 seconds ago   1.14GB
hello-world                              0.1            3a01b854e85e   9 minutes ago    284MB
```

#####  

```console
[opc@admin2-vm1 micronautguide_gradle]$ docker run --name micronautguide_gradle -p 6060:8080 micronautguide_gradle:latest
 __  __ _                                  _   
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
21:31:54.867 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 10ms. Server Running: http://976877fbb5d9:8080
```




別コンソールで`curl http://localhost:6060 `を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:6060
{"message":"Hello World"}
```
