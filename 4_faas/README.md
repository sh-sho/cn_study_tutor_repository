## 4-1 Function as Serviceの基礎

1. ローカル（自分のVM）と東京リージョンでFunctionsの開発ができる環境を整えてください
2. 実行すると、{“message”: “こんにちは”}と返すFunctionを実装し、ローカルで実行してください
3. 2.で作成したFunctionを以下のように修正してください
    1. {“locate”: “US”}を受け取った際に、{“message”: “Hello”}を返す
    2. 入力がない場合は、{“message”: “こんにちは”}を返す
4. で作成したFunctionをOCI Functionsとして実行してください

## 4-2 Function as Serviceの基礎

1. API GatewayのAPIエンドポイントを実行して、#4-1(4)で作成したFunctionsが実行されるようにしてください
2. Object Storage – BucketにCSVファイルが置かれたことをトリガーにOCI Functionsを実行し、そのCSVファイルをJSON形式に変換して別のBucketに格納してください
3. OCI Streamingに格納されたメッセージをSCHを用いてOCI Functionsに連携してください
    1. Functionはそのメッセージをログに出力し、OCI Loggingから参照できるようにしてください
4. FunctionsからBaseDB or ADBに接続してSELECT文の結果を表示してください

