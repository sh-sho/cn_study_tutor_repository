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
[opc@cn cn-study_public]$ git branch
* main
[opc@cn cn-study_public]$
[opc@cn cn-study_public]$
[opc@cn cn-study_public]$ git pull
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 3 (delta 2), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/hatoreka/cn-study_public
   09460bb..d824439  main       -> origin/main
Updating 09460bb..d824439
Fast-forward
 4-k8s/{wordpress copy => wordpress_bk}/kustomization.yaml        | 0
 4-k8s/{wordpress copy => wordpress_bk}/mysql_deployment.yaml     | 0
 4-k8s/{wordpress copy => wordpress_bk}/secret.yaml               | 0
 4-k8s/{wordpress copy => wordpress_bk}/wordpress_deployment.yaml | 0
 4-k8s/{wordpress copy => wordpress_bk}/wordpress_lb.yaml         | 0
 4-k8s/{wordpress copy => wordpress_bk}/wordpress_nodeport.yaml   | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename 4-k8s/{wordpress copy => wordpress_bk}/kustomization.yaml (100%)
 rename 4-k8s/{wordpress copy => wordpress_bk}/mysql_deployment.yaml (100%)
 rename 4-k8s/{wordpress copy => wordpress_bk}/secret.yaml (100%)
 rename 4-k8s/{wordpress copy => wordpress_bk}/wordpress_deployment.yaml (100%)
 rename 4-k8s/{wordpress copy => wordpress_bk}/wordpress_lb.yaml (100%)
 rename 4-k8s/{wordpress copy => wordpress_bk}/wordpress_nodeport.yaml (100%)
```
##### git add
```
[opc@cn cn-study_public]$ echo "test comment" > test.txt
[opc@cn cn-study_public]$ ll
合計 32
drwxr-xr-x. 4 opc docker 4096 10月 27 17:15 3-cowweb
drwxr-xr-x. 5 opc docker 4096  1月 10 10:30 4-k8s
drwxr-xr-x. 4 opc docker 4096 10月 24 22:34 5-IaC
drwxr-xr-x. 2 opc docker   29 10月 25 06:23 6-cicd
drwxrwxr-x  4 opc opc      64 11月 10 16:13 7-Messaging-Streaming
drwxr-xr-x. 4 opc docker   86 10月 24 22:34 OLD_fn-cowweb
-rw-r--r--. 1 opc docker   53 10月 24 22:34 README.md
drwxrwxr-x  2 opc opc      86 12月 27 09:58 a-aa
drwxr-xr-x. 6 opc docker 4096 10月 27 16:55 cowweb_bk
drwxr-xr-x. 6 opc docker 4096 10月 24 22:34 cowweb_version1.2.0
drwxr-xr-x. 2 opc docker   85 10月 24 22:34 en-func
drwxr-xr-x. 6 opc docker 4096 11月  8 06:29 fn-cowweb
-rw-rw-r--  1 opc opc      13  1月 10 11:01 test.txt
[opc@cn cn-study_public]$ git add .
```
##### git commit
```
[opc@cn-ol9 cn-study_public]$ git commit -m "add text.txt"
[season2 e328543] add text.txt
 Committer: Oracle Public Cloud User <opc@cn-ol9.sub10241225480.vcn.oraclevcn.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+)
 create mode 100644 test.txt
[opc@cn-ol9 cn-study_public]$ git config --global user.name "E.N"
[opc@cn-ol9 cn-study_public]$ git config --global user.email sonick2010@gmail.com
[opc@cn-ol9 cn-study_public]$ git config --global -l
credential.helper=store
user.name=E.N
user.email=sonick2010@gmail.com
[opc@cn-ol9 cn-study_public]$
[opc@cn-ol9 cn-study_public]$ cat ~/.gitconfig
[credential]
        helper = store
[user]
        name = E.N
        email = sonick2010@gmail.com
[opc@cn-ol9 cn-study_public]$
```
[補足] name, emailを設定するとAuthorが自動的に変わる。
```
commit 1f1676c1673fd69f5593ccd45f84fdf3c4c515ae (origin/season2)
Author: E.N <sonick2010@gmail.com>
Date:   Wed Jan 10 07:07:16 2024 +0000

    delete test.txt

commit e328543a04e6189dec601573a72d64d432016df3
Author: Oracle Public Cloud User <opc@cn-ol9.sub10241225480.vcn.oraclevcn.com>
Date:   Wed Jan 10 07:04:45 2024 +0000

    add text.txt
```


##### git push
```
[opc@cn-ol9 cn-study_public]$ git branch
  main
* season2
[opc@cn-ol9 cn-study_public]$
[opc@cn-ol9 cn-study_public]$
[opc@cn-ol9 cn-study_public]$ git push
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 6 threads
Compressing objects: 100% (1/1), done.
Writing objects: 100% (3/3), 281 bytes | 281.00 KiB/s, done.
Total 3 (delta 1), reused 2 (delta 1), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/hatoreka/cn-study_public.git
   1f1676c..44d8605  season2 -> season2
```  

##### git switch
```
[opc@cn-ol9 cn-study_public]$ git branch -a
  main
* season2
  remotes/origin/#5_IaC
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/season2
[opc@cn-ol9 cn-study_public]$
[opc@cn-ol9 cn-study_public]$ git switch "#5_IaC"
branch '#5_IaC' set up to track 'origin/#5_IaC'.
Switched to a new branch '#5_IaC'
[opc@cn-ol9 cn-study_public]$ git branch -a
* #5_IaC
  main
  season2
  remotes/origin/#5_IaC
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/season2
[opc@cn-ol9 cn-study_public]$
```
