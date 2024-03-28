## #5-2-3 #5-1-1で実装したアプリケーションをコンテナとして実行してください(Helidon編)

QuickStartで作成したプロジェクト内にDockerfileがあるので、それをDockerイメージとしてビルドする。

```console
[opc@admin2-vm1 5-2-Java_Standard]$ pwd
/home/opc/cn-study_public/5-2-Java_Standard
[opc@admin2-vm1 5-2-Java_Standard]$ cd quickstart-mp/
[opc@admin2-vm1 quickstart-mp]$ pwd
/home/opc/cn-study_public/5-2-Java_Standard/quickstart-mp
[opc@admin2-vm1 quickstart-mp]$ docker build -t quickstart-mp .
[+] Building 0.8s (17/17) FINISHED                                                                                                                                   docker:default
 => [internal] load build definition from Dockerfile                                                                                                                           0.0s
 => => transferring dockerfile: 1.20kB                                                                                                                                         0.0s
 => [internal] load .dockerignore                                                                                                                                              0.0s
 => => transferring context: 48B                                                                                                                                               0.0s
 => [internal] load metadata for container-registry.oracle.com/java/openjdk:21                                                                                                 0.7s
 => [stage-1 1/4] FROM container-registry.oracle.com/java/openjdk:21@sha256:a3c5cf87df06837d0a26f5ea48b6385e77e6b68dcbc828e60fbce1fe90020f41                                   0.0s
 => [internal] load build context                                                                                                                                              0.0s
 => => transferring context: 1.85kB                                                                                                                                            0.0s
 => CACHED [stage-1 2/4] WORKDIR /helidon                                                                                                                                      0.0s
 => CACHED [build 2/9] WORKDIR /usr/share                                                                                                                                      0.0s
 => CACHED [build 3/9] RUN set -x &&     curl -O https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz &&     tar -xvf apache-maven-*-bi  0.0s
 => CACHED [build 4/9] WORKDIR /helidon                                                                                                                                        0.0s
 => CACHED [build 5/9] ADD pom.xml .                                                                                                                                           0.0s
 => CACHED [build 6/9] RUN mvn package -Dmaven.test.skip -Declipselink.weave.skip -Declipselink.weave.skip -DskipOpenApiGenerate                                               0.0s
 => CACHED [build 7/9] ADD src src                                                                                                                                             0.0s
 => CACHED [build 8/9] RUN mvn package -DskipTests                                                                                                                             0.0s
 => CACHED [build 9/9] RUN echo "done!"                                                                                                                                        0.0s
 => CACHED [stage-1 3/4] COPY --from=build /helidon/target/quickstart-mp.jar ./                                                                                                0.0s
 => CACHED [stage-1 4/4] COPY --from=build /helidon/target/libs ./libs                                                                                                         0.0s
 => exporting to image                                                                                                                                                         0.0s
 => => exporting layers                                                                                                                                                        0.0s
 => => writing image sha256:1adef8ba2fa94dc7dbcb383c3d1a8ded7fbc190b495f277d426ba00bc4012ca0                                                                                   0.0s
 => => naming to docker.io/library/quickstart-mp                                                                                                                               0.0s
[opc@admin2-vm1 quickstart-mp]$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
quickstart-mp   latest    1adef8ba2fa9   5 minutes ago   694MB
[opc@admin2-vm1 quickstart-mp]$ 
```

作成したイメージをビルドする。コンテナ側のポート8080に対し、ローカルのポートは7070としている。

```console
[opc@admin2-vm1 quickstart-mp]$ docker run --name qstart-mp -p 7070:8080 quickstart-mp:latest
2024.03.23 06:27:39 WARNING io.helidon.openapi.OpenApiFeature Thread[#1,main,5,main]: Static OpenAPI file not found, checked: [META-INF/openapi.json, META-INF/openapi.yaml, META-INF/openapi.yml]
2024.03.23 06:27:39 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Registering JAX-RS Application: HelidonMP
2024.03.23 06:27:39 WARNING org.glassfish.jersey.server.wadl.WadlFeature Thread[#1,main,5,main]: JAX-B API not found . WADL feature is disabled.
2024.03.23 06:27:39 INFO io.helidon.webserver.ServerListener VirtualThread[#26,start @default (/0.0.0.0:8080)]/runnable@ForkJoinPool-1-worker-1: [0x58059f4a] http://0.0.0.0:8080 bound for socket '@default'
2024.03.23 06:27:39 INFO io.helidon.webserver.LoomServer Thread[#1,main,5,main]: Started all channels in 9 milliseconds. 2505 milliseconds since JVM startup. Java 21.0.2+13-58
2024.03.23 06:27:39 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Server started on http://localhost:8080 (and all other host addresses) in 2510 milliseconds (since JVM startup).
2024.03.23 06:27:40 INFO io.helidon.common.features.HelidonFeatures Thread[#29,features-thread,5,main]: Helidon MP 4.0.6 features: [CDI, Config, Health, Metrics, Open API, Server]
```

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:7070/xxxxx`を実行（詳細は省略）

```console
[opc@admin2-vm1 ~]$ curl http://localhost:7070/greet
{"message":"Hello World!"}[opc@admin2-vm1 ~]$ 
[opc@admin2-vm1 ~]$ 
[opc@admin2-vm1 ~]$ curl http://localhost:7070/health
{"status":"UP","checks":[]}[opc@admin2-vm1 ~]$ 
[opc@admin2-vm1 ~]$ curl http://localhost:7070/metrics
# HELP memory_maxHeap_bytes Displays the maximum amount of heap memory in bytes that can be used for memory management. This attribute displays -1 if the maximum heap memory size is undefined. This amount of memory is not guaranteed to be available for memory management if it is greater than the amount of committed memory. The Java virtual machine may fail to allocate memory even if the amount of used memory does not exceed this maximum size.
# TYPE memory_maxHeap_bytes gauge
memory_maxHeap_bytes{mp_scope="base",} 3.015704576E9
# HELP classloader_loadedClasses_count Displays the number of classes that are currently loaded in the Java virtual machine.
# TYPE classloader_loadedClasses_count gauge
classloader_loadedClasses_count{mp_scope="base",} 8362.0
# HELP personalizedGets_total Counts personalized GET operations
# TYPE personalizedGets_total counter
personalizedGets_total{mp_scope="application",} 0.0
# HELP memory_usedHeap_bytes Displays the amount of used heap memory in bytes.
# TYPE memory_usedHeap_bytes gauge
memory_usedHeap_bytes{mp_scope="base",} 2.8571288E7
# HELP jvm_uptime_seconds Displays the start time of the Java virtual machine in seconds. This attribute displays the approximate time when the Java virtual machine started.
# TYPE jvm_uptime_seconds gauge
jvm_uptime_seconds{mp_scope="base",} 27.45
# HELP thread_daemon_count Displays the current number of live daemon threads.
# TYPE thread_daemon_count gauge
thread_daemon_count{mp_scope="base",} 18.0
# HELP classloader_loadedClasses_total Displays the total number of classes that have been loaded since the Java virtual machine has started execution.
# TYPE classloader_loadedClasses_total counter
classloader_loadedClasses_total{mp_scope="base",} 8363.0
# HELP gc_total Displays the total number of collections that have occurred. This attribute lists -1 if the collection count is undefined for this collector.
# TYPE gc_total counter
gc_total{mp_scope="base",name="G1 Old Generation",} 0.0
gc_total{mp_scope="base",name="G1 Concurrent GC",} 2.0
gc_total{mp_scope="base",name="G1 Young Generation",} 5.0
# HELP memory_committedHeap_bytes Displays the amount of memory in bytes that is committed for the Java virtual machine to use. This amount of memory is guaranteed for the Java virtual machine to use.
# TYPE memory_committedHeap_bytes gauge
memory_committedHeap_bytes{mp_scope="base",} 5.8720256E7
# HELP thread_count Displays the current number of live threads including both daemon and nondaemon threads
# TYPE thread_count gauge
thread_count{mp_scope="base",} 20.0
# HELP cpu_systemLoadAverage Displays the system load average for the last minute. The system load average is the sum of the number of runnable entities queued to the available processors and the number of runnable entities running on the available processors averaged over a period of time. The way in which the load average is calculated is operating system specific but is typically a damped timedependent average. If the load average is not available, a negative value is displayed. This attribute is designed to provide a hint about the system load and may be queried frequently. The load average may be unavailable on some platforms where it is expensive to implement this method.
# TYPE cpu_systemLoadAverage gauge
cpu_systemLoadAverage{mp_scope="base",} 0.28
# HELP thread_max_count Displays the peak live thread count since the Java virtual machine started or peak was reset. This includes daemon and non-daemon threads.
# TYPE thread_max_count gauge
thread_max_count{mp_scope="base",} 20.0
# HELP cpu_availableProcessors Displays the number of processors available to the Java virtual machine. This value may change during a particular invocation of the virtual machine.
# TYPE cpu_availableProcessors gauge
cpu_availableProcessors{mp_scope="base",} 4.0
# HELP requests_count_total Each request (regardless of HTTP method) will increase this counter
# TYPE requests_count_total counter
requests_count_total{mp_scope="vendor",} 3.0
# HELP classloader_unloadedClasses_total Displays the total number of classes unloaded since the Java virtual machine has started execution.
# TYPE classloader_unloadedClasses_total counter
classloader_unloadedClasses_total{mp_scope="base",} 0.0
# HELP gc_time_seconds_total Displays the approximate accumulated collection elapsed time in seconds. This attribute displays -1 if the collection elapsed time is undefined for this collector. The Java virtual machine implementation may use a high resolution timer to measure the elapsed time. This attribute may display the same value even if the collection count has been incremented if the collection elapsed time is very short.
# TYPE gc_time_seconds_total counter
gc_time_seconds_total{mp_scope="base",name="G1 Old Generation",} 0.0
gc_time_seconds_total{mp_scope="base",name="G1 Concurrent GC",} 0.0
gc_time_seconds_total{mp_scope="base",name="G1 Young Generation",} 0.0
# HELP allGets_seconds_max Tracks all GET operations
# TYPE allGets_seconds_max gauge
allGets_seconds_max{mp_scope="application",} 0.0
# HELP allGets_seconds Tracks all GET operations
# TYPE allGets_seconds summary
allGets_seconds{mp_scope="application",quantile="0.5",} 0.0
allGets_seconds{mp_scope="application",quantile="0.75",} 0.0
allGets_seconds{mp_scope="application",quantile="0.95",} 0.0
allGets_seconds{mp_scope="application",quantile="0.98",} 0.0
allGets_seconds{mp_scope="application",quantile="0.99",} 0.0
allGets_seconds{mp_scope="application",quantile="0.999",} 0.0
allGets_seconds_count{mp_scope="application",} 0.0
allGets_seconds_sum{mp_scope="application",} 0.0
[opc@admin2-vm1 ~]$ 
```


