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
Enter the location of your API Signing private key file: /home/oci  o pc/.oci/oci_api_key_90days.pem
Fingerprint: 9b:42:c4:f3:b1:92:38:08:fd:eb:f4:2a:4c:c4:9d:c2
Config written to /home/opc/.oci/config


    If you haven't already uploaded your API Signing public key through the
    console, follow the instructions on the page linked below in the section
    'How to upload the public key':

        https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#How2


[opc@cn-ol9 ~]$ oci os ns get

WARNING: Permissions on /home/opc/.oci/oci_api_key_90days.pem are too open. 
To fix this please try executing the following command: 
oci setup repair-file-permissions --file /home/opc/.oci/oci_api_key_90days.pem 
Alternatively to hide this warning, you may set the environment variable, OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING: 
export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING=True

{
  "data": "nrp9esenpcgb"
}
[opc@cn-ol9 ~]$ oci setup repair-file-permissions --file /home/opc/.oci/oci_api_key_90days.pem
oci setup repair-file-permissions --file /home/opc/.oci/oci_api_key_90days.pem
```

##### Docker(Podman) install

Oracle Linux 9のため、Podmanインストール

https://docs.oracle.com/cd/F61410_01/podman/podman-InstallingPodmanandRelatedUtilities.html#podman-install

```
[opc@cn-ol9 .oci]$ sudo dnf install container-tools
Last metadata expiration check: 0:20:32 ago on Wed 10 Jan 2024 09:05:08 AM GMT.
Dependencies resolved.
======================================================================================================================================================
 Package                                      Architecture            Version                                Repository                          Size
======================================================================================================================================================
Installing:
 container-tools                              noarch                  1-12.0.1.el9                           ol9_appstream                      7.9 k
Installing dependencies:
 aardvark-dns                                 x86_64                  2:1.7.0-1.el9                          ol9_appstream                      1.0 M
 buildah                                      x86_64                  1:1.31.3-2.0.1.el9_3                   ol9_appstream                      8.7 M
 cockpit-podman                               noarch                  76-1.el9_3                             ol9_appstream                      757 k
 conmon                                       x86_64                  2:2.1.8-1.el9                          ol9_appstream                       56 k
 container-selinux                            noarch                  3:2.221.0-1.el9                        ol9_appstream                       68 k
 containernetworking-plugins                  x86_64                  1:1.3.0-6.el9_3                        ol9_appstream                      9.3 M
 containers-common                            x86_64                  2:1-55.0.1.el9                         ol9_appstream                      106 k
 criu                                         x86_64                  3.18-1.el9                             ol9_appstream                      558 k
 crun                                         x86_64                  1.8.7-1.el9                            ol9_appstream                      205 k
 fuse-overlayfs                               x86_64                  1.12-1.el9                             ol9_appstream                       72 k
 libnet                                       x86_64                  1.2-6.el9                              ol9_appstream                       58 k
 libslirp                                     x86_64                  4.4.0-7.el9                            ol9_appstream                       73 k
 netavark                                     x86_64                  2:1.7.0-2.el9_3                        ol9_appstream                      3.6 M
 podman                                       x86_64                  2:4.6.1-7.0.1.el9_3                    ol9_appstream                       15 M
 podman-docker                                noarch                  2:4.6.1-7.0.1.el9_3                    ol9_appstream                      275 k
 podman-remote                                x86_64                  2:4.6.1-7.0.1.el9_3                    ol9_appstream                      9.4 M
 python3-podman                               noarch                  3:4.6.0-1.el9                          ol9_appstream                      267 k
 python3-pyxdg                                noarch                  0.27-3.el9                             ol9_appstream                      144 k
 python3-tomli                                noarch                  2.0.1-5.el9                            ol9_appstream                       52 k
 shadow-utils-subid                           x86_64                  2:4.9-8.el9                            ol9_baseos_latest                   86 k
 skopeo                                       x86_64                  2:1.13.3-3.el9_3                       ol9_appstream                      7.9 M
 slirp4netns                                  x86_64                  1.2.1-1.el9                            ol9_appstream                       50 k
 udica                                        noarch                  0.2.6-30.el9_1                         ol9_appstream                       73 k
 yajl                                         x86_64                  2.1.0-22.el9                           ol9_appstream                       44 k
Installing weak dependencies:
 criu-libs                                    x86_64                  3.18-1.el9                             ol9_appstream                       30 k

Transaction Summary
======================================================================================================================================================
Install  26 Packages

Total download size: 58 M
Installed size: 225 M
Is this ok [y/N]: y
Downloading Packages:
(1/26): shadow-utils-subid-4.9-8.el9.x86_64.rpm                                                                       1.1 MB/s |  86 kB     00:00
(2/26): aardvark-dns-1.7.0-1.el9.x86_64.rpm                                                                            11 MB/s | 1.0 MB     00:00
(3/26): cockpit-podman-76-1.el9_3.noarch.rpm                                                                           36 MB/s | 757 kB     00:00
(4/26): conmon-2.1.8-1.el9.x86_64.rpm                                                                                 5.3 MB/s |  56 kB     00:00
(5/26): container-selinux-2.221.0-1.el9.noarch.rpm                                                                     11 MB/s |  68 kB     00:00
(6/26): container-tools-1-12.0.1.el9.noarch.rpm                                                                       1.5 MB/s | 7.9 kB     00:00
(7/26): containers-common-1-55.0.1.el9.x86_64.rpm                                                                     3.7 MB/s | 106 kB     00:00
(8/26): criu-3.18-1.el9.x86_64.rpm                                                                                     39 MB/s | 558 kB     00:00
(9/26): criu-libs-3.18-1.el9.x86_64.rpm                                                                               5.4 MB/s |  30 kB     00:00
(10/26): buildah-1.31.3-2.0.1.el9_3.x86_64.rpm                                                                         46 MB/s | 8.7 MB     00:00
(11/26): crun-1.8.7-1.el9.x86_64.rpm                                                                                  5.0 MB/s | 205 kB     00:00
(12/26): fuse-overlayfs-1.12-1.el9.x86_64.rpm                                                                          11 MB/s |  72 kB     00:00
(13/26): libnet-1.2-6.el9.x86_64.rpm                                                                                   10 MB/s |  58 kB     00:00
(14/26): libslirp-4.4.0-7.el9.x86_64.rpm                                                                               13 MB/s |  73 kB     00:00
(15/26): netavark-1.7.0-2.el9_3.x86_64.rpm                                                                             74 MB/s | 3.6 MB     00:00
(16/26): containernetworking-plugins-1.3.0-6.el9_3.x86_64.rpm                                                          53 MB/s | 9.3 MB     00:00
(17/26): podman-docker-4.6.1-7.0.1.el9_3.noarch.rpm                                                                   7.5 MB/s | 275 kB     00:00
(18/26): python3-podman-4.6.0-1.el9.noarch.rpm                                                                         22 MB/s | 267 kB     00:00
(19/26): python3-pyxdg-0.27-3.el9.noarch.rpm                                                                           19 MB/s | 144 kB     00:00
(20/26): python3-tomli-2.0.1-5.el9.noarch.rpm                                                                         9.7 MB/s |  52 kB     00:00
(21/26): podman-remote-4.6.1-7.0.1.el9_3.x86_64.rpm                                                                    93 MB/s | 9.4 MB     00:00
(22/26): slirp4netns-1.2.1-1.el9.x86_64.rpm                                                                           8.0 MB/s |  50 kB     00:00
(23/26): udica-0.2.6-30.el9_1.noarch.rpm                                                                               10 MB/s |  73 kB     00:00
(24/26): yajl-2.1.0-22.el9.x86_64.rpm                                                                                 7.0 MB/s |  44 kB     00:00
(25/26): skopeo-1.13.3-3.el9_3.x86_64.rpm                                                                              64 MB/s | 7.9 MB     00:00
(26/26): podman-4.6.1-7.0.1.el9_3.x86_64.rpm                                                                           51 MB/s |  15 MB     00:00
------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                 115 MB/s |  58 MB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                              1/1
  Running scriptlet: container-selinux-3:2.221.0-1.el9.noarch                                                                                    1/26
  Installing       : container-selinux-3:2.221.0-1.el9.noarch                                                                                    1/26
  Running scriptlet: container-selinux-3:2.221.0-1.el9.noarch                                                                                    1/26
  Installing       : fuse-overlayfs-1.12-1.el9.x86_64                                                                                            2/26
  Running scriptlet: fuse-overlayfs-1.12-1.el9.x86_64                                                                                            2/26
  Installing       : containernetworking-plugins-1:1.3.0-6.el9_3.x86_64                                                                          3/26
  Installing       : conmon-2:2.1.8-1.el9.x86_64                                                                                                 4/26
  Installing       : aardvark-dns-2:1.7.0-1.el9.x86_64                                                                                           5/26
  Installing       : netavark-2:1.7.0-2.el9_3.x86_64                                                                                             6/26
  Installing       : shadow-utils-subid-2:4.9-8.el9.x86_64                                                                                       7/26
  Installing       : podman-remote-2:4.6.1-7.0.1.el9_3.x86_64                                                                                    8/26
  Installing       : udica-0.2.6-30.el9_1.noarch                                                                                                 9/26
  Installing       : yajl-2.1.0-22.el9.x86_64                                                                                                   10/26
  Installing       : python3-tomli-2.0.1-5.el9.noarch                                                                                           11/26
  Installing       : python3-pyxdg-0.27-3.el9.noarch                                                                                            12/26
  Installing       : python3-podman-3:4.6.0-1.el9.noarch                                                                                        13/26
  Installing       : libslirp-4.4.0-7.el9.x86_64                                                                                                14/26
  Installing       : slirp4netns-1.2.1-1.el9.x86_64                                                                                             15/26
  Installing       : libnet-1.2-6.el9.x86_64                                                                                                    16/26
  Installing       : criu-3.18-1.el9.x86_64                                                                                                     17/26
  Installing       : criu-libs-3.18-1.el9.x86_64                                                                                                18/26
  Installing       : crun-1.8.7-1.el9.x86_64                                                                                                    19/26
  Installing       : containers-common-2:1-55.0.1.el9.x86_64                                                                                    20/26
  Installing       : podman-2:4.6.1-7.0.1.el9_3.x86_64                                                                                          21/26
  Installing       : cockpit-podman-76-1.el9_3.noarch                                                                                           22/26
  Installing       : podman-docker-2:4.6.1-7.0.1.el9_3.noarch                                                                                   23/26
  Installing       : buildah-1:1.31.3-2.0.1.el9_3.x86_64                                                                                        24/26
  Installing       : skopeo-2:1.13.3-3.el9_3.x86_64                                                                                             25/26
  Installing       : container-tools-1-12.0.1.el9.noarch                                                                                        26/26
  Running scriptlet: container-selinux-3:2.221.0-1.el9.noarch                                                                                   26/26
  Running scriptlet: container-tools-1-12.0.1.el9.noarch                                                                                        26/26
  Verifying        : shadow-utils-subid-2:4.9-8.el9.x86_64                                                                                       1/26
  Verifying        : aardvark-dns-2:1.7.0-1.el9.x86_64                                                                                           2/26
  Verifying        : buildah-1:1.31.3-2.0.1.el9_3.x86_64                                                                                         3/26
  Verifying        : cockpit-podman-76-1.el9_3.noarch                                                                                            4/26
  Verifying        : conmon-2:2.1.8-1.el9.x86_64                                                                                                 5/26
  Verifying        : container-selinux-3:2.221.0-1.el9.noarch                                                                                    6/26
  Verifying        : container-tools-1-12.0.1.el9.noarch                                                                                         7/26
  Verifying        : containernetworking-plugins-1:1.3.0-6.el9_3.x86_64                                                                          8/26
  Verifying        : containers-common-2:1-55.0.1.el9.x86_64                                                                                     9/26
  Verifying        : criu-3.18-1.el9.x86_64                                                                                                     10/26
  Verifying        : criu-libs-3.18-1.el9.x86_64                                                                                                11/26
  Verifying        : crun-1.8.7-1.el9.x86_64                                                                                                    12/26
  Verifying        : fuse-overlayfs-1.12-1.el9.x86_64                                                                                           13/26
  Verifying        : libnet-1.2-6.el9.x86_64                                                                                                    14/26
  Verifying        : libslirp-4.4.0-7.el9.x86_64                                                                                                15/26
  Verifying        : netavark-2:1.7.0-2.el9_3.x86_64                                                                                            16/26
  Verifying        : podman-2:4.6.1-7.0.1.el9_3.x86_64                                                                                          17/26
  Verifying        : podman-docker-2:4.6.1-7.0.1.el9_3.noarch                                                                                   18/26
  Verifying        : podman-remote-2:4.6.1-7.0.1.el9_3.x86_64                                                                                   19/26
  Verifying        : python3-podman-3:4.6.0-1.el9.noarch                                                                                        20/26
  Verifying        : python3-pyxdg-0.27-3.el9.noarch                                                                                            21/26
  Verifying        : python3-tomli-2.0.1-5.el9.noarch                                                                                           22/26
  Verifying        : skopeo-2:1.13.3-3.el9_3.x86_64                                                                                             23/26
  Verifying        : slirp4netns-1.2.1-1.el9.x86_64                                                                                             24/26
  Verifying        : udica-0.2.6-30.el9_1.noarch                                                                                                25/26
  Verifying        : yajl-2.1.0-22.el9.x86_64                                                                                                   26/26

Installed:
  aardvark-dns-2:1.7.0-1.el9.x86_64                       buildah-1:1.31.3-2.0.1.el9_3.x86_64           cockpit-podman-76-1.el9_3.noarch
  conmon-2:2.1.8-1.el9.x86_64                             container-selinux-3:2.221.0-1.el9.noarch      container-tools-1-12.0.1.el9.noarch
  containernetworking-plugins-1:1.3.0-6.el9_3.x86_64      containers-common-2:1-55.0.1.el9.x86_64       criu-3.18-1.el9.x86_64
  criu-libs-3.18-1.el9.x86_64                             crun-1.8.7-1.el9.x86_64                       fuse-overlayfs-1.12-1.el9.x86_64
  libnet-1.2-6.el9.x86_64                                 libslirp-4.4.0-7.el9.x86_64                   netavark-2:1.7.0-2.el9_3.x86_64
  podman-2:4.6.1-7.0.1.el9_3.x86_64                       podman-docker-2:4.6.1-7.0.1.el9_3.noarch      podman-remote-2:4.6.1-7.0.1.el9_3.x86_64
  python3-podman-3:4.6.0-1.el9.noarch                     python3-pyxdg-0.27-3.el9.noarch               python3-tomli-2.0.1-5.el9.noarch
  shadow-utils-subid-2:4.9-8.el9.x86_64                   skopeo-2:1.13.3-3.el9_3.x86_64                slirp4netns-1.2.1-1.el9.x86_64
  udica-0.2.6-30.el9_1.noarch                             yajl-2.1.0-22.el9.x86_64

Complete!
[opc@cn-ol9 .oci]$
[opc@cn-ol9 .oci]$ podman -v
podman version 4.6.1
[opc@cn-ol9 .oci]$ docker -v
Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
podman version 4.6.1
[opc@cn-ol9 .oci]$ podman run quay.io/podman/hello
Trying to pull quay.io/podman/hello:latest...
Getting image source signatures
Copying blob d08b40be6878 done
Copying config e2b3db5d4f done
Writing manifest to image destination
!... Hello Podman World ...!

         .--"--.
       / -     - \
      / (O)   (O) \
   ~~~| -=(,Y,)=- |
    .---. /`  \   |~~
 ~/  o  o \~~~~.----. ~~
  | =(X)= |~  / (O (O) \
   ~~~~~~~  ~| =(Y_)=-  |
  ~~~~    ~~~|   U      |~~

Project:   https://github.com/containers/podman
Website:   https://podman.io
Documents: https://docs.podman.io
Twitter:   @Podman_io
```

##### Podman/Docker compose install

Oracle Linuxの場合

https://docs.oracle.com/ja/learn/podman-compose/index.html#install-podman-compose

```
[opc@cn-ol9 ~]$ sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 56.9M  100 56.9M    0     0  64.7M      0 --:--:-- --:--:-- --:--:--  415M
[opc@cn-ol9 ~]$ sudo chmod +x /usr/local/bin/docker-compose
[opc@cn-ol9 ~]$ docker-compose version
Docker Compose version v2.23.3
[opc@cn-ol9 ~]$ sudo systemctl enable --now podman.socket
Created symlink /etc/systemd/system/sockets.target.wants/podman.socket → /usr/lib/systemd/system/podman.socket.
[opc@cn-ol9 ~]$ sudo systemctl status podman.socket
● podman.socket - Podman API Socket
     Loaded: loaded (/usr/lib/systemd/system/podman.socket; enabled; preset: disabled)
     Active: active (listening) since Wed 2024-01-10 09:39:33 GMT; 1s ago
      Until: Wed 2024-01-10 09:39:33 GMT; 1s ago
   Triggers: ● podman.service
       Docs: man:podman-system-service(1)
     Listen: /run/podman/podman.sock (Stream)
     CGroup: /system.slice/podman.socket

Jan 10 09:39:33 cn-ol9 systemd[1]: Listening on Podman API Socket.
[opc@cn-ol9 ~]$ sudo yum install python-pip
Last metadata expiration check: 0:44:32 ago on Wed 10 Jan 2024 09:05:08 AM GMT.
Dependencies resolved.
======================================================================================================================================================
 Package                             Architecture                   Version                               Repository                             Size
======================================================================================================================================================
Installing:
 python3-pip                         noarch                         21.2.3-7.el9                          ol9_appstream                         2.9 M

Transaction Summary
======================================================================================================================================================
Install  1 Package

Total download size: 2.9 M
Installed size: 8.7 M
Is this ok [y/N]: y
Downloading Packages:
python3-pip-21.2.3-7.el9.noarch.rpm                                                                                    47 MB/s | 2.9 MB     00:00
------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                  45 MB/s | 2.9 MB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                              1/1
  Installing       : python3-pip-21.2.3-7.el9.noarch                                                                                              1/1
  Running scriptlet: python3-pip-21.2.3-7.el9.noarch                                                                                              1/1
  Verifying        : python3-pip-21.2.3-7.el9.noarch                                                                                              1/1

Installed:
  python3-pip-21.2.3-7.el9.noarch

Complete!
[opc@cn-ol9 ~]$
[opc@cn-ol9 ~]$ sudo -H pip3 install --upgrade pip
Requirement already satisfied: pip in /usr/lib/python3.9/site-packages (21.2.3)
Collecting pip
  Downloading pip-23.3.2-py3-none-any.whl (2.1 MB)
     |████████████████████████████████| 2.1 MB 10.8 MB/s
Installing collected packages: pip
  WARNING: The scripts pip, pip3, pip3.11 and pip3.9 are installed in '/usr/local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed pip-23.3.2
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
[opc@cn-ol9 ~]$ sudo pip3 install podman-compose
Collecting podman-compose
  Downloading podman_compose-1.0.6-py2.py3-none-any.whl (34 kB)
Requirement already satisfied: pyyaml in /usr/lib64/python3.9/site-packages (from podman-compose) (5.4.1)
Collecting python-dotenv (from podman-compose)
  Downloading python_dotenv-1.0.0-py3-none-any.whl (19 kB)
Installing collected packages: python-dotenv, podman-compose
  WARNING: The script dotenv is installed in '/usr/local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script podman-compose is installed in '/usr/local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed podman-compose-1.0.6 python-dotenv-1.0.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
[opc@cn-ol9 ~]$ podman-compose version
podman-compose version: 1.0.6
['podman', '--version', '']
using podman version: 4.6.1
podman-compose version 1.0.6
podman --version
podman version 4.6.1
exit code: 0
[opc@cn-ol9 ~]$
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