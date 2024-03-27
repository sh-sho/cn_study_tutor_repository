## #5-2-3 #5-1-1で実装したアプリケーションをコンテナとして実行してください

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

別コンソールで`curl http://localhost:7070/greet`を実行

```console
[opc@admin2-vm1 ~]$ curl http://localhost:7070/greet
{"message":"Hello World!"}
[opc@admin2-vm1 ~]$
```
