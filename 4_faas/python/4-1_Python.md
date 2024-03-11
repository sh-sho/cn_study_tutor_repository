### 1. ローカル（自分のVM）と東京リージョンでFunctionsの開発ができる環境を整えてください


### 2. 実行すると、{“message”: “こんにちは”}と返すFunctionを実装し、ローカルで実行してください
※ ファイルは./pythonfn以下を参照

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
⇒詳細は

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
invoke
```console
ubuntu@public-instance-tokunaga-ubuntu2:~/4_fn/pythonfn$ echo '{"name":"こんにちは"}' | sudo fn invoke hello-app pythonfn | jq
{
  "message": "こんにちは"
}
```

### 3. 2.で作成したFunctionを以下のように修正してください
{“locate”: “US”}を受け取った際に、{“message”: “Hello”}を返す
入力がない場合は、{“message”: “こんにちは”}を返す

２で作成した'func.py'を書き換えるだけ
locateが”US”の文字を受け取ったときだけ“message”: “Hello”を返すというif文を実装する。



### 4. で作成したFunctionをOCI Functionsとして実行してください
