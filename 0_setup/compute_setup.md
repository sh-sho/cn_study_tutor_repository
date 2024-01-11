# Compute作成 & セットアップ
OCI CLI, Docker, Docker Compose, kubectl, Fn CLI

### 前提条件
- OCIにてAPIキーを取得し、セットアップする環境の任意フォルダに配置していること

  https://docs.oracle.com/ja-jp/iaas/Content/API/SDKDocs/cliinstall.htm#configfile

### 実行結果の例
##### OCI CLI Install & setup

```
[opc@cn-ol9 ~]$ sudo yum install oraclelinux-developer-release-el9
Last metadata expiration check: 0:02:51 ago on Wed 10 Jan 2024 09:01:25 AM GMT.
Dependencies resolved.
======================================================================================================================================================
 Package                                             Architecture             Version                       Repository                           Size
======================================================================================================================================================
Installing:
 oraclelinux-developer-release-el9                   x86_64                   1.0-2.el9                     ol9_baseos_latest                    14 k

Transaction Summary
======================================================================================================================================================
Install  1 Package

Total download size: 14 k
Installed size: 18 k
Is this ok [y/N]: y
Downloading Packages:
oraclelinux-developer-release-el9-1.0-2.el9.x86_64.rpm                                                                310 kB/s |  14 kB     00:00
------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                 299 kB/s |  14 kB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                              1/1
  Installing       : oraclelinux-developer-release-el9-1.0-2.el9.x86_64                                                                           1/1
  Verifying        : oraclelinux-developer-release-el9-1.0-2.el9.x86_64                                                                           1/1

Installed:
  oraclelinux-developer-release-el9-1.0-2.el9.x86_64

Complete!
[opc@cn-ol9 ~]$ sudo yum install python39-oci-cli
Last metadata expiration check: 0:00:02 ago on Wed 10 Jan 2024 09:05:08 AM GMT.
Dependencies resolved.
======================================================================================================================================================
 Package                                       Architecture              Version                          Repository                             Size
======================================================================================================================================================
Installing:
 python39-oci-cli                              noarch                    3.37.1-1.el9                     ol9_developer                          37 M
Upgrading:
 python39-oci-sdk                              x86_64                    2.118.0-1.el9                    ol9_developer                          70 M
Installing dependencies:
 python3-arrow                                 noarch                    1.1.0-2.el9                      ol9_oci_included                      153 k
 python3-importlib-metadata                    noarch                    4.12.0-2.el9                     ol9_developer_EPEL                     75 k
 python3-jmespath                              noarch                    0.10.0-4.el9                     ol9_oci_included                       78 k
 python3-prompt-toolkit                        noarch                    3.0.29-1.el9                     ol9_oci_included                      1.0 M
 python3-terminaltables                        noarch                    3.1.0-23.el9                     ol9_oci_included                       63 k
 python3-wcwidth                               noarch                    0.2.5-8.el9                      ol9_appstream                          65 k
 python3-zipp                                  noarch                    0.5.1-1.el9                      ol9_developer_EPEL                     24 k

Transaction Summary
======================================================================================================================================================
Install  8 Packages
Upgrade  1 Package

Total download size: 108 M
Is this ok [y/N]: y
Downloading Packages:
(1/9): python3-jmespath-0.10.0-4.el9.noarch.rpm                                                                       1.0 MB/s |  78 kB     00:00
(2/9): python3-arrow-1.1.0-2.el9.noarch.rpm                                                                           1.9 MB/s | 153 kB     00:00
(3/9): python3-terminaltables-3.1.0-23.el9.noarch.rpm                                                                 8.0 MB/s |  63 kB     00:00
(4/9): python3-prompt-toolkit-3.0.29-1.el9.noarch.rpm                                                                  11 MB/s | 1.0 MB     00:00
(5/9): python3-zipp-0.5.1-1.el9.noarch.rpm                                                                            2.1 MB/s |  24 kB     00:00
(6/9): python3-wcwidth-0.2.5-8.el9.noarch.rpm                                                                          13 MB/s |  65 kB     00:00
(7/9): python3-importlib-metadata-4.12.0-2.el9.noarch.rpm                                                             3.2 MB/s |  75 kB     00:00
(8/9): python39-oci-cli-3.37.1-1.el9.noarch.rpm                                                                        88 MB/s |  37 MB     00:00
(9/9): python39-oci-sdk-2.118.0-1.el9.x86_64.rpm                                                                      102 MB/s |  70 MB     00:00
------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                 137 MB/s | 108 MB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                              1/1
  Upgrading        : python39-oci-sdk-2.118.0-1.el9.x86_64                                                                                       1/10
  Installing       : python3-wcwidth-0.2.5-8.el9.noarch                                                                                          2/10
  Installing       : python3-prompt-toolkit-3.0.29-1.el9.noarch                                                                                  3/10
  Installing       : python3-zipp-0.5.1-1.el9.noarch                                                                                             4/10
  Installing       : python3-importlib-metadata-4.12.0-2.el9.noarch                                                                              5/10
  Installing       : python3-terminaltables-3.1.0-23.el9.noarch                                                                                  6/10
  Installing       : python3-jmespath-0.10.0-4.el9.noarch                                                                                        7/10
  Installing       : python3-arrow-1.1.0-2.el9.noarch                                                                                            8/10
  Installing       : python39-oci-cli-3.37.1-1.el9.noarch                                                                                        9/10
  Cleanup          : python39-oci-sdk-2.93.1-1.el9.x86_64                                                                                       10/10
  Running scriptlet: python39-oci-sdk-2.93.1-1.el9.x86_64                                                                                       10/10
  Verifying        : python3-arrow-1.1.0-2.el9.noarch                                                                                            1/10
  Verifying        : python3-jmespath-0.10.0-4.el9.noarch                                                                                        2/10
  Verifying        : python3-prompt-toolkit-3.0.29-1.el9.noarch                                                                                  3/10
  Verifying        : python3-terminaltables-3.1.0-23.el9.noarch                                                                                  4/10
  Verifying        : python3-importlib-metadata-4.12.0-2.el9.noarch                                                                              5/10
  Verifying        : python3-zipp-0.5.1-1.el9.noarch                                                                                             6/10
  Verifying        : python3-wcwidth-0.2.5-8.el9.noarch                                                                                          7/10
  Verifying        : python39-oci-cli-3.37.1-1.el9.noarch                                                                                        8/10
  Verifying        : python39-oci-sdk-2.118.0-1.el9.x86_64                                                                                       9/10
  Verifying        : python39-oci-sdk-2.93.1-1.el9.x86_64                                                                                       10/10

Upgraded:
  python39-oci-sdk-2.118.0-1.el9.x86_64
Installed:
  python3-arrow-1.1.0-2.el9.noarch                  python3-importlib-metadata-4.12.0-2.el9.noarch        python3-jmespath-0.10.0-4.el9.noarch
  python3-prompt-toolkit-3.0.29-1.el9.noarch        python3-terminaltables-3.1.0-23.el9.noarch            python3-wcwidth-0.2.5-8.el9.noarch
  python3-zipp-0.5.1-1.el9.noarch                   python39-oci-cli-3.37.1-1.el9.noarch

Complete!

```

##### OCI config setup 
```
[opc@cn-ol9 ~]$ oci setup config

    This command provides a walkthrough of creating a valid CLI config file.

    The following links explain where to find the information required by this
    script:

    User API Signing Key, OCID and Tenancy OCID:

        https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#Other

    Region:

        https://docs.cloud.oracle.com/Content/General/Concepts/regions.htm

    General config documentation:

        https://docs.cloud.oracle.com/Content/API/Concepts/sdkconfig.htm


Enter a location for your config [/home/opc/.oci/config]: 
Enter a user OCID: ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Enter a tenancy OCID: ocid1.tenancy.oc1..aaaaaaaagxxxxxxxxxxxxxxxxxxxxxxx
Enter a region by index or name(e.g.
1: af-johannesburg-1, 2: ap-chiyoda-1, 3: ap-chuncheon-1, 4: ap-dcc-canberra-1, 5: ap-hyderabad-1,
6: ap-ibaraki-1, 7: ap-melbourne-1, 8: ap-mumbai-1, 9: ap-osaka-1, 10: ap-seoul-1,
11: ap-singapore-1, 12: ap-sydney-1, 13: ap-tokyo-1, 14: ca-montreal-1, 15: ca-toronto-1,
16: eu-amsterdam-1, 17: eu-dcc-dublin-1, 18: eu-dcc-dublin-2, 19: eu-dcc-milan-1, 20: eu-dcc-milan-2,
21: eu-dcc-rating-1, 22: eu-dcc-rating-2, 23: eu-frankfurt-1, 24: eu-madrid-1, 25: eu-marseille-1,
26: eu-milan-1, 27: eu-paris-1, 28: eu-stockholm-1, 29: eu-zurich-1, 30: il-jerusalem-1,
31: me-abudhabi-1, 32: me-dcc-muscat-1, 33: me-dubai-1, 34: me-jeddah-1, 35: mx-queretaro-1,
36: sa-santiago-1, 37: sa-saopaulo-1, 38: sa-vinhedo-1, 39: uk-cardiff-1, 40: uk-gov-cardiff-1,
41: uk-gov-london-1, 42: uk-london-1, 43: us-ashburn-1, 44: us-chicago-1, 45: us-gov-ashburn-1,
46: us-gov-chicago-1, 47: us-gov-phoenix-1, 48: us-langley-1, 49: us-luke-1, 50: us-phoenix-1,
51: us-sanjose-1): 13
Do you want to generate a new API Signing RSA key pair? (If you decline you will be asked to supply the path to an existing key.) [Y/n]: n
Enter the location of your API Signing private key file: /home/oci  o pc/.oci/oci_api_key.pem
Fingerprint: 9b:42:c4:f3:b1:92:38:08:fd:eb:f4:2a:4c:c4:9d:c2
Config written to /home/opc/.oci/config


    If you haven't already uploaded your API Signing public key through the
    console, follow the instructions on the page linked below in the section
    'How to upload the public key':

        https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#How2


[opc@cn-ol9 ~]$ oci os ns get

WARNING: Permissions on /home/opc/.oci/oci_api_key.pem are too open. 
To fix this please try executing the following command: 
oci setup repair-file-permissions --file /home/opc/.oci/oci_api_key.pem 
Alternatively to hide this warning, you may set the environment variable, OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING: 
export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING=True

{
  "data": "xxxxxxxx"
}
[opc@cn-ol9 ~]$ oci setup repair-file-permissions --file /home/opc/.oci/oci_api_key.pem
oci setup repair-file-permissions --file /home/opc/.oci/oci_api_key.pem
```

##### Docker install

PodmanだとFn serverが動作しないためDockerをインストールする

```

```

##### Docker compose install

Oracle Linuxの場合

https://docs.oracle.com/ja/learn/podman-compose/index.html#install-podman-compose

```

```

##### kubectl install

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux

```
[opc@cn-ol9 ~]$   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   138  100   138    0     0    784      0 --:--:-- --:--:-- --:--:--   784
100 47.4M  100 47.4M    0     0   123M      0 --:--:-- --:--:-- --:--:--  270M
[opc@cn-ol9 ~]$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   138  100   138    0     0    775      0 --:--:-- --:--:-- --:--:--   770
100    64  100    64    0     0    309      0 --:--:-- --:--:-- --:--:--   309
[opc@cn-ol9 ~]$ echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
kubectl: OK
[opc@cn-ol9 ~]$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
[opc@cn-ol9 ~]$ kubectl version --client
Client Version: v1.29.0
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
[opc@cn-ol9 ~]$ kubectl version --client --output=yaml
clientVersion:
  buildDate: "2023-12-13T08:51:44Z"
  compiler: gc
  gitCommit: 3f7a50f38688eb332e2a1b013678c6435d539ae6
  gitTreeState: clean
  gitVersion: v1.29.0
  goVersion: go1.21.5
  major: "1"
  minor: "29"
  platform: linux/amd64
kustomizeVersion: v5.0.4-0.20230601165947-6ce0bf390ce3
```

##### Fn CLI

https://github.com/fnproject/cli/blob/master/README.md

```
[opc@cn-ol9 ~]$ curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
fn version 0.6.28

        ______
       / ____/___
      / /_  / __ \
     / __/ / / / /
    /_/   /_/ /_/`

[opc@cn-ol9 ~]$
```