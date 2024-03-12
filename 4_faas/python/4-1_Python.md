### 1. ローカル（自分のVM）と東京リージョンでFunctionsの開発ができる環境を整えてください

[OCI Functionsのクライアント環境構成のノート](https://docs.oracle.com/ja-jp/iaas/Content/Functions/Tasks/functionsconfiguringclient.htm)<br>
上記のドキュメントを確認しながら、Fn ProjectのCLIのインストールやコンテキストの設定をする。<br>
※us-ashburn-1を例にして４で設定例を公開

### 2. 実行すると、{“message”: “こんにちは”}と返すFunctionを実装し、ローカルで実行してください
※ ファイルは`./pythonfn`以下を参照

Python言語を指定して、ひな形を作成する
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn$ fn init --runtime python pythonfn
Creating function at: ./pythonfn
Function boilerplate generated.
func.yaml created.
ubuntu@public-instance-tokunaga-ubuntu2:
```
ひな形のまま実行すると`{"message": "Hello World"}`を返すので、Pythonを少し書き換える。<br>
※`{"message": "Hello {0}".format(name)})`を`{"message": "{0}".format(name)})`に修正<br>
⇒詳細は[func.py](https://github.com/sh-sho/cn_study_tutor_repository/blob/4-1_FaaS_tokunaga/4_faas/python/pythonfn/func.py)を確認

`hello-app`というアプリを作成
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn3$ fn create app hello-app
Successfully created app:  hello-app
```

deploy
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn3$ sudo fn deploy --app hello-app --local
Deploying pythonfn to app: hello-app
Bumped to version 0.0.2
Using Container engine docker
Building image pythonfn:0.0.2 .
Updating function pythonfn using image pythonfn:0.0.2...
Successfully created function: pythonfn with pythonfn:0.0.2
```
invoke<br>
{“message”: “こんにちは”}が返ってくることを確認
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn$ echo '{"name":"こんにちは"}' | sudo fn invoke hello-app pythonfn | jq
{
  "message": "こんにちは"
}
```

### 3. 2.で作成したFunctionを以下のように修正してください
{“locate”: “US”}を受け取った際に、{“message”: “Hello”}を返す
入力がない場合は、{“message”: “こんにちは”}を返す

※ ファイルは`./pythonfn2`以下を参照

２で作成した'func.py'を書き換えるだけ
locateが”US”の文字を受け取ったときだけ“message”: “Hello”を返すというif文を実装する。<br>
⇒詳細は[func.py](https://github.com/sh-sho/cn_study_tutor_repository/blob/4-1_FaaS_tokunaga/4_faas/pythonfn2/func.py)を確認

deploy
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn2$ sudo fn deploy --app hello-app2 --local
Deploying pythonfn2 to app: hello-app2
Bumped to version 0.0.5
Using Container engine docker
Building image pythonfn2:0.0.5 .
Updating function pythonfn2 using image pythonfn2:0.0.5...
Successfully created function: pythonfn2 with pythonfn2:0.0.5
```

invoke<br>
{"locate":"US"}だと、{"message": "Hello"}が返ってきているが、
{"locate":"USA"}だと、{"message": "こんにちは"}が返ってきているのを確認
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn2$ echo '{"locate":"US"}' | sudo fn invoke hello-app2 pythonfn2
{"message": "Hello"}
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn2$ echo '{"locate":"USA"}' | sudo fn invoke hello-app2 pythonfn2 | jq
{
  "message": "こんにちは"
}
```

### 4. で作成したFunctionをOCI Functionsとして実行してください

`oci-devops-handson-app`という名前のアプリケーションをOCIコンソールで作成する
<img width="553" alt="image" src="https://github.com/sh-sho/cn_study_tutor_repository/assets/140580748/4ffe69b1-a244-4b70-ba88-a2bf834951cc">

contextを設定する。今回はus-ashburn-1のレジストリやコンパートメントを指定する。
```console
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ fn list context
CURRENT NAME            PROVIDER        API URL                                                 REGISTRY
        default         oracle-cs
*       us-ashburn-1    oracle-cs       https://functions.us-ashburn-1.oci.oraclecloud.com
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ fn update context oracle.compartment-id [compartment-ocid]
Current context updated oracle.compartment-id with [compartment-ocid]
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ fn update context registry iad.ocir.io/orasejapan/tokunaga_func
Current context updated registry with iad.ocir.io/orasejapan/tokunaga_func
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ fn update context oracle.profile "DEFAULT"
Current context updated oracle.profile with DEFAULT
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ docker login iad.ocir.io
Username (orasejapan/oracleidentitycloudservice/ritsuko.tokunaga@oracle.com): orasejapan/oracleidentitycloudservice/ritsuko.tokunaga@oracle.com
Password: 
WARNING! Your password will be stored unencrypted in /home/ritsuko_to/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```
deploy<br>
ここで指定するアプリ名は、コンソール上で作成した`oci-devops-handson-app`を指定する
```console
ritsuko_to@cloudshell:~ (us-ashburn-1)$ cd pythonfn2
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ fn deploy --app oci-devops-handson-app
Deploying pythonfn2 to app: oci-devops-handson-app
Bumped to version 0.0.8
Using Container engine docker
Building image iad.ocir.io/orasejapan/tokunaga_func/pythonfn2/pythonfn2:0.0.8 TargetedPlatform:  amd64HostPlatform:  amd64
..........................
Using Container engine  docker  to push
Pushing iad.ocir.io/orasejapan/tokunaga_func/pythonfn2/pythonfn2:0.0.8 to docker registry...The push refers to repository [iad.ocir.io/orasejapan/tokunaga_func/pythonfn2/pythonfn2]
19fc9ab031fe: Pushed 
cdc5c91948f0: Pushed 
15d75410485c: Pushed 
58f82f48752b: Pushed 
03d5f9d77ddf: Pushed 
401c9daff908: Pushed 
7e9f3f6c7a0a: Pushed 
0.0.8: digest: sha256:916bd4cf905ad375f2ba0b5866360d2c75c42570927941fec45491e3504096cb size: 1780
Updating function pythonfn2 using image iad.ocir.io/orasejapan/tokunaga_func/pythonfn2/pythonfn2:0.0.8...
Successfully created function: pythonfn2 with iad.ocir.io/orasejapan/tokunaga_func/pythonfn2/pythonfn2:0.0.8
ritsuko_to@cloudshell:pythonfn2 (us-ashburn-1)$ fn invoke oci-devops-handson-app fnpython2
```
deployができると、コンソール上からもファンクションが追加されているのが確認できる。
（今回はpythonfn2が追加されている）
<img width="419" alt="image" src="https://github.com/sh-sho/cn_study_tutor_repository/assets/140580748/7c297f1c-7efe-46bf-9fbb-3c1d8fcdd087">

またOCI上のレジストリにもアップロードされていることを確認
<img width="613" alt="image" src="https://github.com/sh-sho/cn_study_tutor_repository/assets/140580748/d34ef41c-d823-4962-9065-b225597bb535">

invoke<br>

```console
ritsuko_to@cloudshell:~ (us-ashburn-1)$ echo '{"locate":"US"}' | fn invoke oci-devops-handson-app pythonfn2 | jq
{
  "message": "Hello"
}
ritsuko_to@cloudshell:~ (us-ashburn-1)$ echo '{"locate":"USA"}' | fn invoke oci-devops-handson-app pythonfn2 | jq
{
  "message": "こんにちは"
}
```
