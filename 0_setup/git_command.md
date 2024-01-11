# Gitの”超”基本操作
clone, pull, add, commit, push, switch, …

### 前提条件
- 実行環境でアクセストークンの発行と設定は実施済みであること
  
  https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens


### 実行結果の例
##### git clone
```
[opc@cn work]$ git clone https://github.com/sh-sho/cn_study_tutor_repository.git
Cloning into 'cn_study_tutor_repository'...
remote: Enumerating objects: 24, done.
remote: Counting objects: 100% (24/24), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 24 (delta 0), reused 20 (delta 0), pack-reused 0
Unpacking objects: 100% (24/24), done.
[opc@cn work]$ ll
合計 4
drwxrwxr-x 13 opc opc 4096  1月 10 10:18 cn_study_tutor_repository
[opc@cn work]$ ls -l cn_study_tutor_repository/
合計 4
drwxrwxr-x 2 opc opc 23  1月 10 10:18 0_setup
drwxrwxr-x 2 opc opc 23  1月 10 10:18 1_oci_cli
drwxrwxr-x 2 opc opc 23  1月 10 10:18 2_iac
drwxrwxr-x 2 opc opc 23  1月 10 10:18 3_docker
drwxrwxr-x 2 opc opc 23  1月 10 10:18 4_faas
drwxrwxr-x 2 opc opc 23  1月 10 10:18 5_java
drwxrwxr-x 2 opc opc 23  1月 10 10:18 6_kubernetes
drwxrwxr-x 2 opc opc 23  1月 10 10:18 7_cicd
drwxrwxr-x 2 opc opc 23  1月 10 10:18 8_messaging
drwxrwxr-x 2 opc opc 23  1月 10 10:18 9_observability
-rw-rw-r-- 1 opc opc 27  1月 10 10:18 README.md
[opc@cn work]$
```

##### git pull
```

```
##### git add
```

```
##### git commit
```

```

[補足] name, emailを設定するとAuthorが自動的に変わる。

```

```


##### git push
```

```  

##### git switch
```

```
