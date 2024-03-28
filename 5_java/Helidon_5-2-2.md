## 5-2-2 #5-1-1で実装したアプリケーションをExecutable JARとして実行してください

### #5-1-1で作成したパッケージの実行

```console
[opc@admin2-vm1 quickstart-mp]$ java -jar target/quickstart-mp.jar 
2024.03.23 14:49:14 WARNING io.helidon.openapi.OpenApiFeature Thread[#1,main,5,main]: Static OpenAPI file not found, checked: [META-INF/openapi.json, META-INF/openapi.yaml, META-INF/openapi.yml]
2024.03.23 14:49:15 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Registering JAX-RS Application: HelidonMP
2024.03.23 14:49:15 WARNING org.glassfish.jersey.server.wadl.WadlFeature Thread[#1,main,5,main]: JAX-B API not found . WADL feature is disabled.
2024.03.23 14:49:15 INFO io.helidon.webserver.ServerListener VirtualThread[#26,start @default (/0.0.0.0:8080)]/runnable@ForkJoinPool-1-worker-1: [0x742c0848] http://0.0.0.0:8080 bound for socket '@default'
2024.03.23 14:49:15 INFO io.helidon.webserver.LoomServer Thread[#1,main,5,main]: Started all channels in 10 milliseconds. 2562 milliseconds since JVM startup. Java 21.0.2+13-LTS-58
2024.03.23 14:49:15 INFO io.helidon.microprofile.server.ServerCdiExtension Thread[#1,main,5,main]: Server started on http://localhost:8080 (and all other host addresses) in 2567 milliseconds (since JVM startup).
2024.03.23 14:49:15 INFO io.helidon.common.features.HelidonFeatures Thread[#29,features-thread,5,main]: Helidon MP 4.0.6 features: [CDI, Config, Health, Metrics, Open API, Server]
```

#### `curl http://localhost:8080/health`を実行すると、`{“status”: “UP”, ”checks”: []}` と返却される

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:8080/health`を実行。アプリケーションに関する各種メトリクスが表示される。

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/health
{"status":"UP","checks":[]}
[opc@admin2-vm1 ~]$
```

#### `curl http://localhost:8080/metrics`を実行すると、アプリケーションのメトリクス情報が返却される

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:8080/metrics`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/metrics
# HELP classloader_loadedClasses_total Displays the total number of classes that have been loaded since the Java virtual machine has started execution.
# TYPE classloader_loadedClasses_total counter
classloader_loadedClasses_total{mp_scope="base",} 8364.0
# HELP gc_time_seconds_total Displays the approximate accumulated collection elapsed time in seconds. This attribute displays -1 if the collection elapsed time is undefined for this collector. The Java virtual machine implementation may use a high resolution timer to measure the elapsed time. This attribute may display the same value even if the collection count has been incremented if the collection elapsed time is very short.
# TYPE gc_time_seconds_total counter
gc_time_seconds_total{mp_scope="base",name="G1 Old Generation",} 0.0
gc_time_seconds_total{mp_scope="base",name="G1 Concurrent GC",} 0.0
gc_time_seconds_total{mp_scope="base",name="G1 Young Generation",} 0.0
# HELP requests_count_total Each request (regardless of HTTP method) will increase this counter
# TYPE requests_count_total counter
requests_count_total{mp_scope="vendor",} 4.0
# HELP jvm_uptime_seconds Displays the start time of the Java virtual machine in seconds. This attribute displays the approximate time when the Java virtual machine started.
# TYPE jvm_uptime_seconds gauge
jvm_uptime_seconds{mp_scope="base",} 261.267
# HELP gc_total Displays the total number of collections that have occurred. This attribute lists -1 if the collection count is undefined for this collector.
# TYPE gc_total counter
gc_total{mp_scope="base",name="G1 Old Generation",} 0.0
gc_total{mp_scope="base",name="G1 Concurrent GC",} 2.0
gc_total{mp_scope="base",name="G1 Young Generation",} 6.0
# HELP thread_count Displays the current number of live threads including both daemon and nondaemon threads
# TYPE thread_count gauge
thread_count{mp_scope="base",} 15.0
# HELP classloader_loadedClasses_count Displays the number of classes that are currently loaded in the Java virtual machine.
# TYPE classloader_loadedClasses_count gauge
classloader_loadedClasses_count{mp_scope="base",} 8369.0
# HELP memory_committedHeap_bytes Displays the amount of memory in bytes that is committed for the Java virtual machine to use. This amount of memory is guaranteed for the Java virtual machine to use.
# TYPE memory_committedHeap_bytes gauge
memory_committedHeap_bytes{mp_scope="base",} 3.8797312E7
# HELP cpu_systemLoadAverage Displays the system load average for the last minute. The system load average is the sum of the number of runnable entities queued to the available processors and the number of runnable entities running on the available processors averaged over a period of time. The way in which the load average is calculated is operating system specific but is typically a damped timedependent average. If the load average is not available, a negative value is displayed. This attribute is designed to provide a hint about the system load and may be queried frequently. The load average may be unavailable on some platforms where it is expensive to implement this method.
# TYPE cpu_systemLoadAverage gauge
cpu_systemLoadAverage{mp_scope="base",} 0.29
# HELP memory_maxHeap_bytes Displays the maximum amount of heap memory in bytes that can be used for memory management. This attribute displays -1 if the maximum heap memory size is undefined. This amount of memory is not guaranteed to be available for memory management if it is greater than the amount of committed memory. The Java virtual machine may fail to allocate memory even if the amount of used memory does not exceed this maximum size.
# TYPE memory_maxHeap_bytes gauge
memory_maxHeap_bytes{mp_scope="base",} 1.962934272E9
# HELP thread_max_count Displays the peak live thread count since the Java virtual machine started or peak was reset. This includes daemon and non-daemon threads.
# TYPE thread_max_count gauge
thread_max_count{mp_scope="base",} 15.0
# HELP classloader_unloadedClasses_total Displays the total number of classes unloaded since the Java virtual machine has started execution.
# TYPE classloader_unloadedClasses_total counter
classloader_unloadedClasses_total{mp_scope="base",} 0.0
# HELP cpu_availableProcessors Displays the number of processors available to the Java virtual machine. This value may change during a particular invocation of the virtual machine.
# TYPE cpu_availableProcessors gauge
cpu_availableProcessors{mp_scope="base",} 2.0
# HELP personalizedGets_total Counts personalized GET operations
# TYPE personalizedGets_total counter
personalizedGets_total{mp_scope="application",} 0.0
# HELP memory_usedHeap_bytes Displays the amount of used heap memory in bytes.
# TYPE memory_usedHeap_bytes gauge
memory_usedHeap_bytes{mp_scope="base",} 2.872656E7
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
# HELP thread_daemon_count Displays the current number of live daemon threads.
# TYPE thread_daemon_count gauge
thread_daemon_count{mp_scope="base",} 13.0
[opc@admin2-vm1 ~]$
```

#### `curl http://localhost:8080/greet`を実行すると、`{“message”: “Hello world”}` と返却される

アプリケーションを実行した状態で、別コンソールで`curl http://localhost:8080/greet`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:8080/greet
{"message":"Hello World!"}
```
