# Java基礎 #5-2-2 #5-1-1で実装したアプリケーションをExecutable JARとして実行してください


Executable JARファイルを作成する。

```console
$ ./mvnw package
...
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  4.642 s
[INFO] Finished at: 2024-04-02T01:06:34+09:00
[INFO] ------------------------------------------------------------------------
```

/target以下にjarファイルができる。

jarファイルを起動
```console
$ java -jar target/helloworld-0.1.jar 
 __  __ _                                  _   
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_ 
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_ 
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
01:07:12.476 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 600ms. Server Running: http://localhost:8080
```

