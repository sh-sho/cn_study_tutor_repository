# Gitの”超”基本操作

## 前提条件
- 実行環境でgitアクセストークンの発行と設定は実施済みであること

## 実行結果の例

### 1. git clone

<details><summary>(例)git clone</summary><div>

```
[opc@cn-ol9 work]$ git clone https://github.com/sh-sho/cn_study_tutor_repository.git
Cloning into 'cn_study_tutor_repository'...
remote: Enumerating objects: 49, done.
remote: Counting objects: 100% (49/49), done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 49 (delta 8), reused 40 (delta 6), pack-reused 0
Receiving objects: 100% (49/49), 11.67 KiB | 11.67 MiB/s, done.
Resolving deltas: 100% (8/8), done.
[opc@cn-ol9 work]$ ll
total 4
drwxr-xr-x. 13 opc opc 4096 Jan 12 03:46 cn_study_tutor_repository
[opc@cn-ol9 work]$ cd cn_study_tutor_repository/
[opc@cn-ol9 cn_study_tutor_repository]$ ll
total 4
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 0_setup
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 1_oci_cli
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 2_iac
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 3_docker
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 4_faas
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 5_java
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 6_kubernetes
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 7_cicd
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 8_messaging
drwxr-xr-x. 2 opc opc 23 Jan 12 03:46 9_observability
-rw-r--r--. 1 opc opc 27 Jan 12 03:46 README.md
[opc@cn-ol9 cn_study_tutor_repository]$ git branch
* main
[opc@cn-ol9 cn_study_tutor_repository]$

```

</div></details>

### 2. git pull

<details><summary>(例)git pull</summary><div>

```
[opc@cn-ol9 cn_study_tutor_repository]$ git pull
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 7 (delta 1), reused 7 (delta 1), pack-reused 0
Unpacking objects: 100% (7/7), 5.40 KiB | 5.40 MiB/s, done.
From https://github.com/sh-sho/cn_study_tutor_repository
   b232f3a..47316ad  0_事前準備 -> origin/0_事前準備
Already up to date.
[opc@cn-ol9 cn_study_tutor_repository]$
```
</div></details>

### 3. git add

<details><summary>(例)git add</summary><div>

```
[opc@cn-ol9 cn_study_tutor_repository]$ echo "test" > test.txt
[opc@cn-ol9 cn_study_tutor_repository]$ git add .
```
</div></details>

### 4. git commit

<details><summary>(例)git commit</summary><div>

```
[opc@cn-ol9 cn_study_tutor_repository]$ git commit -m "Add test.txt"
[main dbea90f] Add test.txt
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
[opc@cn-ol9 cn_study_tutor_repository]$
```
</div></details>

### (補足) name, emailを設定するとAuthorを変更できる。

<details><summary>(例)Author変更</summary><div>

```
[opc@cn-ol9 cn_study_tutor_repository]$ git config --global user.email "37202082+hatoreka@users.noreply.github.com"
[opc@cn-ol9 cn_study_tutor_repository]$ git commit --amend --reset-author
[main 6bd0d34] Add test.txt
 1 file changed, 1 insertion(+)
 create mode 100644 test.txt
[opc@cn-ol9 cn_study_tutor_repository]$ git log
commit 6bd0d34a1c7b3627e065cb5a8bb5e9ad44b34963 (HEAD -> main)
Author: hatoreka <37202082+hatoreka@users.noreply.github.com>
Date:   Thu Jan 11 09:21:16 2024 +0000

    Add test.txt

commit 2dad61e8e296535f29dd498781c364b222190569 (origin/main, origin/HEAD)
Author: Oracle Public Cloud User <opc@cn-ol9.sub10241225480.vcn.oraclevcn.com>
Date:   Thu Jan 11 09:12:02 2024 +0000

    delete test.txt
```

</div></details>

### 5. git push

<details><summary>(例)git push</summary><div>

```
[opc@cn-ol9 0_setup]$ git push
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 6 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 354 bytes | 354.00 KiB/s, done.
Total 4 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/sh-sho/cn_study_tutor_repository.git
   47316ad..bece733  0_事前準備 -> 0_事前準備
```  

</div></details>

### 6. git switch

<details><summary>(例)git switch</summary><div>

```
[opc@cn-ol9 0_setup]$ git fetch
[opc@cn-ol9 0_setup]$
[opc@cn-ol9 0_setup]$ git branch -a
* 0_事前準備
  main
  remotes/origin/0_事前準備
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/ritsuko_test
[opc@cn-ol9 0_setup]$
[opc@cn-ol9 0_setup]$ git switch main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
[opc@cn-ol9 0_setup]$ git branch -a
  0_事前準備
* main
  remotes/origin/0_事前準備
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/ritsuko_test
```
</div></details>
