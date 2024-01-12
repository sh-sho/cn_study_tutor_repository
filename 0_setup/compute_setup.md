# Compute作成 & セットアップ

### 前提条件
- OCIにてAPIキーを取得し、セットアップする環境の任意フォルダに配置していること
- 実行結果の例で使用している環境はOracle Linux 9(DockerはOracle Linux 7もあり)
- コンテナツールとしてPodmanを利用しても構わないが、Dockerをインストールした環境を用意しておくこと。PodmanだとFn serverがローカルで実行できず、一部の課題が実施できない

### 実行結果の例

1. OCI CLI install
2. OCI config setup
3. Docker install (Oracle Linux 7)
4. Docker install (Oracle Linux 9)
5. Podman install
6. Docker compose install (Oracle Linux 7)
7. Docker compose install (Oracle Linux 9)
8. Podman compose install
9. kubectl install
10. Fn CLI install

##### 1. OCI CLI install

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

##### 2. OCI config setup 
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

##### 3. Docker install (Oracle Linux 7)

OracleLinux7の場合はDockerインストール可能だが、OracleLinux8以降はDockerはサポートされていないためPodmanをインストールする。ただしPodmanだとFn serverが動作しない

https://docs.oracle.com/cd/F61410_01/docker/docker-InstallingOracleContainerRuntimeforDocker.html#docker-install-docker

```
[opc@cn-ol7 ~]$ sudo yum install docker-engine docker-cli
Loaded plugins: langpacks, ulninfo
Resolving Dependencies
--> Running transaction check
---> Package docker-cli.x86_64 0:19.03.11.ol-13.el7 will be installed
---> Package docker-engine.x86_64 0:19.03.11.ol-13.el7 will be installed
--> Processing Dependency: container-selinux >= 2:2.77 for package: docker-engine-19.03.11.ol-13.el7.x86_64
--> Processing Dependency: containerd >= 1.4.8 for package: docker-engine-19.03.11.ol-13.el7.x86_64
--> Processing Dependency: runc >= 3:1.0.0-1.rc95 for package: docker-engine-19.03.11.ol-13.el7.x86_64
--> Running transaction check
---> Package container-selinux.noarch 2:2.119.2-1.911c772.el7_8 will be installed
---> Package containerd.x86_64 0:1.4.8-1.el7 will be installed
---> Package runc.x86_64 3:1.1.7-1.el7 will be installed
--> Processing Dependency: criu for package: 3:runc-1.1.7-1.el7.x86_64
--> Running transaction check
---> Package criu.x86_64 0:3.12-2.el7 will be installed
--> Processing Dependency: libprotobuf-c.so.1(LIBPROTOBUF_C_1.0.0)(64bit) for package: criu-3.12-2.el7.x86_64
--> Processing Dependency: libnet.so.1()(64bit) for package: criu-3.12-2.el7.x86_64
--> Processing Dependency: libprotobuf-c.so.1()(64bit) for package: criu-3.12-2.el7.x86_64
--> Running transaction check
---> Package libnet.x86_64 0:1.1.6-7.el7 will be installed
---> Package protobuf-c.x86_64 0:1.0.2-3.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

======================================================================================================================================================
 Package                             Arch                     Version                                        Repository                          Size
======================================================================================================================================================
Installing:
 docker-cli                          x86_64                   19.03.11.ol-13.el7                             ol7_addons                          33 M
 docker-engine                       x86_64                   19.03.11.ol-13.el7                             ol7_addons                          21 M
Installing for dependencies:
 container-selinux                   noarch                   2:2.119.2-1.911c772.el7_8                      ol7_oci_included                    39 k
 containerd                          x86_64                   1.4.8-1.el7                                    ol7_addons                          29 M
 criu                                x86_64                   3.12-2.el7                                     ol7_latest                         452 k
 libnet                              x86_64                   1.1.6-7.el7                                    ol7_latest                          57 k
 protobuf-c                          x86_64                   1.0.2-3.el7                                    ol7_latest                          27 k
 runc                                x86_64                   3:1.1.7-1.el7                                  ol7_addons                         2.9 M

Transaction Summary
======================================================================================================================================================
Install  2 Packages (+6 Dependent packages)

Total download size: 87 M
Installed size: 356 M
Is this ok [y/d/N]: y
Downloading packages:
(1/8): criu-3.12-2.el7.x86_64.rpm                                                                                              | 452 kB  00:00:00
(2/8): container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm                                                                    |  39 kB  00:00:00
(3/8): containerd-1.4.8-1.el7.x86_64.rpm                                                                                       |  29 MB  00:00:00
(4/8): docker-engine-19.03.11.ol-13.el7.x86_64.rpm                                                                             |  21 MB  00:00:00
(5/8): docker-cli-19.03.11.ol-13.el7.x86_64.rpm                                                                                |  33 MB  00:00:00
(6/8): runc-1.1.7-1.el7.x86_64.rpm                                                                                             | 2.9 MB  00:00:00
(7/8): libnet-1.1.6-7.el7.x86_64.rpm                                                                                           |  57 kB  00:00:00
(8/8): protobuf-c-1.0.2-3.el7.x86_64.rpm                                                                                       |  27 kB  00:00:00
------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                 101 MB/s |  87 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : 2:container-selinux-2.119.2-1.911c772.el7_8.noarch                                                                                 1/8
  Installing : containerd-1.4.8-1.el7.x86_64                                                                                                      2/8
  Installing : docker-cli-19.03.11.ol-13.el7.x86_64                                                                                               3/8
  Installing : libnet-1.1.6-7.el7.x86_64                                                                                                          4/8
  Installing : protobuf-c-1.0.2-3.el7.x86_64                                                                                                      5/8
  Installing : criu-3.12-2.el7.x86_64                                                                                                             6/8
  Installing : 3:runc-1.1.7-1.el7.x86_64                                                                                                          7/8
  Installing : docker-engine-19.03.11.ol-13.el7.x86_64                                                                                            8/8
xfs_info: cannot open /var/lib: Is a directory
  Verifying  : protobuf-c-1.0.2-3.el7.x86_64                                                                                                      1/8
  Verifying  : 2:container-selinux-2.119.2-1.911c772.el7_8.noarch                                                                                 2/8
  Verifying  : criu-3.12-2.el7.x86_64                                                                                                             3/8
  Verifying  : docker-engine-19.03.11.ol-13.el7.x86_64                                                                                            4/8
  Verifying  : containerd-1.4.8-1.el7.x86_64                                                                                                      5/8
  Verifying  : libnet-1.1.6-7.el7.x86_64                                                                                                          6/8
  Verifying  : 3:runc-1.1.7-1.el7.x86_64                                                                                                          7/8
  Verifying  : docker-cli-19.03.11.ol-13.el7.x86_64                                                                                               8/8

Installed:
  docker-cli.x86_64 0:19.03.11.ol-13.el7                                   docker-engine.x86_64 0:19.03.11.ol-13.el7

Dependency Installed:
  container-selinux.noarch 2:2.119.2-1.911c772.el7_8    containerd.x86_64 0:1.4.8-1.el7    criu.x86_64 0:3.12-2.el7    libnet.x86_64 0:1.1.6-7.el7
  protobuf-c.x86_64 0:1.0.2-3.el7                       runc.x86_64 3:1.1.7-1.el7

Complete!
[opc@cn-ol7 ~]$ sudo systemctl enable --now docker
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
[opc@cn-ol7 ~]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Fri 2024-01-12 01:21:24 GMT; 8s ago
     Docs: https://docs.docker.com
 Main PID: 26168 (dockerd)
    Tasks: 8
   Memory: 29.7M
   CGroup: /system.slice/docker.service
           └─26168 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.169338447Z" level=warning msg="Your kernel does not support cgroup blkio weight"
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.169666803Z" level=warning msg="Your kernel does not support cgroup blkio weight_device"
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.170134560Z" level=info msg="Loading containers: start."
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.456126901Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon opt...d IP address"
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.626398536Z" level=info msg="Loading containers: done."
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.655587595Z" level=warning msg="Not using native diff for overlay2, this may cause degraded performance for bu...iver=overlay2
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.656189905Z" level=info msg="Docker daemon" commit=9bb540d graphdriver(s)=overlay2 version=19.03.11-ol
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.656648489Z" level=info msg="Daemon has completed initialization"
Jan 12 01:21:24 cn-ol7 systemd[1]: Started Docker Application Container Engine.
Jan 12 01:21:24 cn-ol7 dockerd[26168]: time="2024-01-12T01:21:24.697493713Z" level=info msg="API listen on /var/run/docker.sock"
Hint: Some lines were ellipsized, use -l to show in full.
[opc@cn-ol7 ~]$ sudo docker info
Client:
 Debug Mode: false

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 19.03.11-ol
 Storage Driver: overlay2
  Backing Filesystem: xfs
  Supports d_type: true
  Native Overlay Diff: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 7eba5930496d9bbe375fdf71603e610ad737d2b2
 runc version: 860f061
 init version: fec3683
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 5.4.17-2136.325.5.1.el7uek.x86_64
 Operating System: Oracle Linux Server 7.9
 OSType: linux
 Architecture: x86_64
 CPUs: 2
 Total Memory: 7.469GiB
 Name: cn-ol7
 ID: U3MG:XIWF:LOFH:WERY:RLDV:LWLM:DEZL:BLX3:BWJG:F4WQ:CY2J:N32O
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false

Registries:
```

##### 4. Docker install (Oracle Linux 9)

Oracle Linux 8/9もDockerインストールはできるがサポートされない

```
[opc@cn-ol9 cn_study_tutor_repository]$ sudo dnf install -y docker-ce --nobest
Last metadata expiration check: 0:01:56 ago on Fri 12 Jan 2024 04:35:31 AM GMT.
Dependencies resolved.
======================================================================================================================================================
 Package                                      Architecture              Version                             Repository                           Size
======================================================================================================================================================
Installing:
 docker-ce                                    x86_64                    3:24.0.7-1.el9                      docker-ce-stable                     24 M
Installing dependencies:
 container-selinux                            noarch                    3:2.221.0-1.el9                     ol9_appstream                        68 k
 containerd.io                                x86_64                    1.6.26-3.1.el9                      docker-ce-stable                     34 M
 docker-ce-cli                                x86_64                    1:24.0.7-1.el9                      docker-ce-stable                    7.1 M
 fuse-overlayfs                               x86_64                    1.12-1.el9                          ol9_appstream                        72 k
 libslirp                                     x86_64                    4.4.0-7.el9                         ol9_appstream                        73 k
 slirp4netns                                  x86_64                    1.2.1-1.el9                         ol9_appstream                        50 k
Installing weak dependencies:
 docker-buildx-plugin                         x86_64                    0.11.2-1.el9                        docker-ce-stable                     13 M
 docker-ce-rootless-extras                    x86_64                    24.0.7-1.el9                        docker-ce-stable                    3.9 M
 docker-compose-plugin                        x86_64                    2.21.0-1.el9                        docker-ce-stable                     13 M

Transaction Summary
======================================================================================================================================================
Install  10 Packages

Total download size: 94 M
Installed size: 369 M
Downloading Packages:
(1/10): containerd.io-1.6.26-3.1.el9.x86_64.rpm                                                                        85 MB/s |  34 MB     00:00
(2/10): docker-buildx-plugin-0.11.2-1.el9.x86_64.rpm                                                                   29 MB/s |  13 MB     00:00
(3/10): docker-ce-cli-24.0.7-1.el9.x86_64.rpm                                                                          47 MB/s | 7.1 MB     00:00
(4/10): docker-ce-rootless-extras-24.0.7-1.el9.x86_64.rpm                                                              22 MB/s | 3.9 MB     00:00
(5/10): container-selinux-2.221.0-1.el9.noarch.rpm                                                                    1.8 MB/s |  68 kB     00:00
(6/10): fuse-overlayfs-1.12-1.el9.x86_64.rpm                                                                           10 MB/s |  72 kB     00:00
(7/10): libslirp-4.4.0-7.el9.x86_64.rpm                                                                                10 MB/s |  73 kB     00:00
(8/10): slirp4netns-1.2.1-1.el9.x86_64.rpm                                                                            7.7 MB/s |  50 kB     00:00
(9/10): docker-compose-plugin-2.21.0-1.el9.x86_64.rpm                                                                  57 MB/s |  13 MB     00:00
(10/10): docker-ce-24.0.7-1.el9.x86_64.rpm                                                                             21 MB/s |  24 MB     00:01
------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                  83 MB/s |  94 MB     00:01
Docker CE Stable - x86_64                                                                                              44 kB/s | 1.6 kB     00:00
Importing GPG key 0x621E9F35:
 Userid     : "Docker Release (CE rpm) <docker@docker.com>"
 Fingerprint: 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35
 From       : https://download.docker.com/linux/centos/gpg
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                              1/1
  Running scriptlet: container-selinux-3:2.221.0-1.el9.noarch                                                                                    1/10
  Installing       : container-selinux-3:2.221.0-1.el9.noarch                                                                                    1/10
  Running scriptlet: container-selinux-3:2.221.0-1.el9.noarch                                                                                    1/10
  Installing       : docker-compose-plugin-2.21.0-1.el9.x86_64                                                                                   2/10
  Running scriptlet: docker-compose-plugin-2.21.0-1.el9.x86_64                                                                                   2/10
  Installing       : containerd.io-1.6.26-3.1.el9.x86_64                                                                                         3/10
  Running scriptlet: containerd.io-1.6.26-3.1.el9.x86_64                                                                                         3/10
  Installing       : libslirp-4.4.0-7.el9.x86_64                                                                                                 4/10
  Installing       : slirp4netns-1.2.1-1.el9.x86_64                                                                                              5/10
  Installing       : fuse-overlayfs-1.12-1.el9.x86_64                                                                                            6/10
  Running scriptlet: fuse-overlayfs-1.12-1.el9.x86_64                                                                                            6/10
  Installing       : docker-buildx-plugin-0.11.2-1.el9.x86_64                                                                                    7/10
  Running scriptlet: docker-buildx-plugin-0.11.2-1.el9.x86_64                                                                                    7/10
  Installing       : docker-ce-cli-1:24.0.7-1.el9.x86_64                                                                                         8/10
  Running scriptlet: docker-ce-cli-1:24.0.7-1.el9.x86_64                                                                                         8/10
  Installing       : docker-ce-rootless-extras-24.0.7-1.el9.x86_64                                                                               9/10
  Running scriptlet: docker-ce-rootless-extras-24.0.7-1.el9.x86_64                                                                               9/10
  Installing       : docker-ce-3:24.0.7-1.el9.x86_64                                                                                            10/10
  Running scriptlet: docker-ce-3:24.0.7-1.el9.x86_64                                                                                            10/10
  Running scriptlet: container-selinux-3:2.221.0-1.el9.noarch                                                                                   10/10
  Running scriptlet: docker-ce-3:24.0.7-1.el9.x86_64                                                                                            10/10
  Verifying        : containerd.io-1.6.26-3.1.el9.x86_64                                                                                         1/10
  Verifying        : docker-buildx-plugin-0.11.2-1.el9.x86_64                                                                                    2/10
  Verifying        : docker-ce-3:24.0.7-1.el9.x86_64                                                                                             3/10
  Verifying        : docker-ce-cli-1:24.0.7-1.el9.x86_64                                                                                         4/10
  Verifying        : docker-ce-rootless-extras-24.0.7-1.el9.x86_64                                                                               5/10
  Verifying        : docker-compose-plugin-2.21.0-1.el9.x86_64                                                                                   6/10
  Verifying        : container-selinux-3:2.221.0-1.el9.noarch                                                                                    7/10
  Verifying        : fuse-overlayfs-1.12-1.el9.x86_64                                                                                            8/10
  Verifying        : libslirp-4.4.0-7.el9.x86_64                                                                                                 9/10
  Verifying        : slirp4netns-1.2.1-1.el9.x86_64                                                                                             10/10

Installed:
  container-selinux-3:2.221.0-1.el9.noarch          containerd.io-1.6.26-3.1.el9.x86_64         docker-buildx-plugin-0.11.2-1.el9.x86_64
  docker-ce-3:24.0.7-1.el9.x86_64                   docker-ce-cli-1:24.0.7-1.el9.x86_64         docker-ce-rootless-extras-24.0.7-1.el9.x86_64
  docker-compose-plugin-2.21.0-1.el9.x86_64         fuse-overlayfs-1.12-1.el9.x86_64            libslirp-4.4.0-7.el9.x86_64
  slirp4netns-1.2.1-1.el9.x86_64

Complete!
[opc@cn-ol9 cn_study_tutor_repository]$ systemctl status docker.service
○ docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; preset: disabled)
     Active: inactive (dead)
TriggeredBy: ○ docker.socket
       Docs: https://docs.docker.com
[opc@cn-ol9 cn_study_tutor_repository]$ sudo systemctl enable docker.service
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
[opc@cn-ol9 cn_study_tutor_repository]$ sudo systemctl start docker.service
[opc@cn-ol9 cn_study_tutor_repository]$ systemctl status docker.service
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: disabled)
     Active: active (running) since Fri 2024-01-12 04:42:40 GMT; 7s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 323217 (dockerd)
      Tasks: 12
     Memory: 31.3M
        CPU: 230ms
     CGroup: /system.slice/docker.service
             └─323217 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jan 12 04:42:40 cn-ol9 systemd[1]: Starting Docker Application Container Engine...
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.523838593Z" level=info msg="Starting up"
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.553899863Z" level=info msg="Loading containers: start."
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.697132159Z" level=info msg="Loading containers: done."
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.705827446Z" level=warning msg="Not using native diff for overlay2, this may cause d>
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.706014872Z" level=info msg="Docker daemon" commit=311b9ff graphdriver=overlay2 vers>
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.706111568Z" level=info msg="Daemon has completed initialization"
Jan 12 04:42:40 cn-ol9 dockerd[323217]: time="2024-01-12T04:42:40.751886166Z" level=info msg="API listen on /run/docker.sock"
Jan 12 04:42:40 cn-ol9 systemd[1]: Started Docker Application Container Engine.
[opc@cn-ol9 cn_study_tutor_repository]$
```

##### (補足)Dockerコマンドをroot以外で実行する方法

https://docs.oracle.com/cd/F61410_01/docker/docker-ManagingtheDockerEngineService.html#docker-service-group

```
[opc@cn-ol7 ~]$ sudo groupadd docker
groupadd: group 'docker' already exists
[opc@cn-ol7 ~]$ sudo systemctl restart docker
[opc@cn-ol7 ~]$ sudo usermod -a -G docker opc
[opc@cn-ol7 ~]$ docker info
Client:
 Debug Mode: false

Server:
ERROR: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.40/info": dial unix /var/run/docker.sock: connect: permission denied
errors pretty printing info

(ログアウトして再ログイン。おそらく再ログインしないと設定が反映されない)

[opc@cn-ol7 ~]$ docker info
Client:
 Debug Mode: false

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 19.03.11-ol
 Storage Driver: overlay2
  Backing Filesystem: xfs
  Supports d_type: true
  Native Overlay Diff: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 7eba5930496d9bbe375fdf71603e610ad737d2b2
 runc version: 860f061
 init version: fec3683
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 5.4.17-2136.325.5.1.el7uek.x86_64
 Operating System: Oracle Linux Server 7.9
 OSType: linux
 Architecture: x86_64
 CPUs: 2
 Total Memory: 7.469GiB
 Name: cn-ol7
 ID: U3MG:XIWF:LOFH:WERY:RLDV:LWLM:DEZL:BLX3:BWJG:F4WQ:CY2J:N32O
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false

Registries:
```


##### 5. Podman install

Oracle Linux8以上の場合はPodmanをインストール

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

##### 6. Docker compose install (Oracle Linux 7)

https://docs.docker.com/compose/install/linux/#install-the-plugin-manually

```
[opc@cn-ol7 ~]$ DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
[opc@cn-ol7 ~]$ mkdir -p $DOCKER_CONFIG/cli-plugins
[opc@cn-ol7 ~]$ curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 56.9M  100 56.9M    0     0  79.4M      0 --:--:-- --:--:-- --:--:-- 79.4M
[opc@cn-ol7 ~]$ chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
[opc@cn-ol7 ~]$ docker compose version
Docker Compose version v2.23.3
[opc@cn-ol7 ~]$

```

##### 7. Docker compose install (Oracle Linux 9)

https://github.com/docker/compose?tab=readme-ov-file#linux

```
[opc@cn-ol9 work]$ wget https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-linux-x86_64
--2024-01-12 06:14:26--  https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-linux-x86_64
Resolving github.com (github.com)... 20.27.177.113
Connecting to github.com (github.com)|20.27.177.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/15045751/e816d5ea-1af6-40c6-a90e-8d0e18fbbb9e?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240112T061426Z&X-Amz-Expires=300&X-Amz-Signature=bf9be11d6ffd68553c45772f12e10d5965d3be1964d20ca80224831c393a17a4&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=15045751&response-content-disposition=attachment%3B%20filename%3Ddocker-compose-linux-x86_64&response-content-type=application%2Foctet-stream [following]
--2024-01-12 06:14:27--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/15045751/e816d5ea-1af6-40c6-a90e-8d0e18fbbb9e?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240112T061426Z&X-Amz-Expires=300&X-Amz-Signature=bf9be11d6ffd68553c45772f12e10d5965d3be1964d20ca80224831c393a17a4&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=15045751&response-content-disposition=attachment%3B%20filename%3Ddocker-compose-linux-x86_64&response-content-type=application%2Foctet-stream
Resolving objects.githubusercontent.com (objects.githubusercontent.com)... 185.199.108.133, 185.199.109.133, 185.199.110.133, ...
Connecting to objects.githubusercontent.com (objects.githubusercontent.com)|185.199.108.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 60932257 (58M) [application/octet-stream]
Saving to: ‘docker-compose-linux-x86_64’

docker-compose-linux-x86_64           100%[=======================================================================>]  58.11M   378MB/s    in 0.2s

2024-01-12 06:14:27 (378 MB/s) - ‘docker-compose-linux-x86_64’ saved [60932257/60932257]

[opc@cn-ol9 work]$ chmod +x docker-compose-linux-x86_64
[opc@cn-ol9 work]$ sudo mv docker-compose-linux-x86_64 /usr/local/bin/
[opc@cn-ol9 work]$ docker-compose version
Docker Compose version v2.23.3
```

##### 8. Podman compose install

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

##### 9. kubectl install

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

##### 10. Fn CLI install

https://github.com/fnproject/cli/blob/master/README.md

PodmanだとFn serverが動作しないため、Dockerをインストールしたサーバで実行している。Oracle Linux 9にDockerをインストールした場合も同様

```
[opc@cn-ol7 ~]$ fn version
Client version is latest version: 0.6.28
Server version:  0.3.750
[opc@cn-ol7 ~]$ curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
fn version 0.6.28

        ______
       / ____/___
      / /_  / __ \
     / __/ / / / /
    /_/   /_/ /_/`

[opc@cn-ol7 ~]$ fn start
2024/01/12 03:52:50 ¡¡¡ 'fn start' should NOT be used for PRODUCTION !!! see https://github.com/fnproject/fn-helm/
Unable to find image 'fnproject/fnserver:latest' locally
Trying to pull repository docker.io/fnproject/fnserver ...
latest: Pulling from docker.io/fnproject/fnserver
ff3a5c916c92: Pull complete
1a649ea86bca: Pull complete
ce35f4d5f86a: Pull complete
b6206661264b: Pull complete
b8b71dba24d3: Pull complete
3873004a68ee: Pull complete
f4205b132661: Pull complete
91a85eeeb257: Pull complete
93c96d032b32: Pull complete
bb761748d6e1: Pull complete
81f6c51c4ac2: Pull complete
2ba715696dba: Pull complete
f46c2b56aaf3: Pull complete
66d07b1eeeb9: Pull complete
bf871b66822c: Pull complete
Digest: sha256:2a2071f8af6ed6ad6476ad2e794f757874dad347b5ef14869dd31ee252810655
Status: Downloaded newer image for fnproject/fnserver:latest
time="2024-01-12T03:52:59Z" level=info msg="Setting log level to" fields.level=info
time="2024-01-12T03:52:59Z" level=info msg="Registering data store provider 'sql'"
time="2024-01-12T03:52:59Z" level=info msg="Connecting to DB" url="sqlite3:///app/data/fn.db"
time="2024-01-12T03:52:59Z" level=info msg="datastore dialed" datastore=sqlite3 max_idle_connections=256 url="sqlite3:///app/data/fn.db"
time="2024-01-12T03:52:59Z" level=info msg="agent starting cfg={MinDockerVersion:17.10.0-ce ContainerLabelTag: DockerNetworks: DockerLoadFile: DisableUnprivilegedContainers:false FreezeIdle:50ms HotPoll:200ms HotLauncherTimeout:1h0m0s HotPullTimeout:10m0s HotStartTimeout:5s DetachedHeadRoom:6m0s MaxResponseSize:0 MaxHdrResponseSize:0 MaxLogSize:1048576 MaxTotalCPU:0 MaxTotalMemory:0 MaxFsSize:0 MaxPIDs:50 MaxOpenFiles:0xc420402708 MaxLockedMemory:0xc420402720 MaxPendingSignals:0xc420402728 MaxMessageQueue:0xc420402730 PreForkPoolSize:0 PreForkImage:busybox PreForkCmd:tail -f /dev/null PreForkUseOnce:0 PreForkNetworks: EnableNBResourceTracker:false MaxTmpFsInodes:0 DisableReadOnlyRootFs:false DisableDebugUserLogs:false IOFSEnableTmpfs:false EnableFDKDebugInfo:false IOFSAgentPath:/iofs IOFSMountRoot:/home/opc/.fn/iofs IOFSOpts: ImageCleanMaxSize:0 ImageCleanExemptTags: ImageEnableVolume:false}"
time="2024-01-12T03:52:59Z" level=info msg="no docker auths from config files found (this is fine)" error="open /root/.dockercfg: no such file or directory"
time="2024-01-12T03:52:59Z" level=info msg="available memory" cgroup_limit=9223372036854771712 head_room=620466176 total_memory=6204661760
time="2024-01-12T03:52:59Z" level=info msg="ram reservations" avail_memory=5584195584
time="2024-01-12T03:52:59Z" level=info msg="available cpu" avail_cpu=2000 total_cpu=2000
time="2024-01-12T03:52:59Z" level=info msg="cpu reservations" cpu=2000
time="2024-01-12T03:52:59Z" level=info msg="\n        ______\n       / ____/___\n      / /_  / __ \\\n     / __/ / / / /\n    /_/   /_/ /_/\n"
time="2024-01-12T03:52:59Z" level=info msg="Fn serving on `:8080`" type=full version=0.3.750
```
もう一つコンソールを立ち上げて、curlで確認
```
[opc@cn-ol7 ~]$ curl http://localhost:8080
{"goto":"https://github.com/fnproject/fn","hello":"world!"}[opc@cn-ol7 ~]$
```
