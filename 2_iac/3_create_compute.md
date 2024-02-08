# 3. VCNのパブリック・サブネットにComputeを作成し、SSHで接続可能かを確認する。

## 前提
* terraformがインストールされていること
```console
$ terraform -v
Terraform v1.2.9
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.7.0. You can update by downloading from https://www.terraform.io/downloads.html
```
* ComputeはUbuntu 22.04を使用

## 作成するリソース
* VCN (VCNウィザード相当) 
* Compute
  * OCI CLI, Docker, Docker Compose, kubectl, Fn CLIがインストール済み


## Terraform設定ファイル
* `2_iac/compute/`

```console
├── main-var.tf //mainの変数ファイル
├── main.tf // mainのTerraformファイル
├── modules
│   ├── compute
│   │   ├── compute-var.tf // computeの変数ファイル
│   │   ├── compute.tf // computeのTerraformファイル
│   │   ├── instance_init
│   │   │   └── install_init.yaml // cloud-initファイル
│   │   └── outputs.tf // computeの出力
│   └── vcn
│       ├── outputs.tf // vcnの出力
│       ├── vcn-var.tf // vcnの変数ファイル
│       └── vcn.tf // vcnのTerraformファイル
├── outputs.tf //出力ファイル
└── provider.tf //プロバイダ

```


### 1. Terraformの実行
terraform applyをすると、VCNとComputeが作られ、自動でOCI CLI, docker, docker compose, kubectl, Fn CLIがインストールされます。


```console
$ pwd
/home/ubuntu/cn_study_tutor_repository/2_iac/compute

$ terraform apply --var-file=./main.tfvars
module.vcn.data.oci_core_services.all_oci_services: Reading...
module.vcn.data.oci_core_services.all_oci_services: Read complete after 1s [id=CoreServicesDataSource-0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:
      ...

Apply complete! Resources: 11 added, 0 changed, 0 destroyed.

Outputs:

instance-OCPUs = 2
instance-memory-in-GBs = 64
instance-name = "tf-sobata"
instance-region = "phx"
instance-shape = "VM.Standard.E4.Flex"
public-ip-for-compute-instance = "158.101.16.30"
time-created = "2024-02-02 06:40:50.038 +0000 UTC"
```

VCNとComputeが作成されます。SSHで接続してOCI CLIなどがインストールされているか確認してください。

以下に`main.tfvars`のサンプルを記載しています。

```tf
display_vnic_name = "test_vnic"
display_instance_name = "test_instance"
vcn_display_name = "test_VCN"
compartment_id = "ocid1.compartment.oc1..axxx"
tenancy_ocid = "ocid1.tenancy.oc1..axxx"
user_ocid = "ocid1.user.oc1..axxx"
fingerprint = "xx:xx:xxxxx"
private_key_path = "<PRIVATE_API_KEY_PATH>"
public_ssh_key_path = "<PUBLIC_KEY_PATH>"
```


## 3. ComputeのTerraformの内容
以下、ComputeのTerraformの内容です。
```terraform
terraform {
  required_providers {
    oci = {
        source = "oracle/oci"
        version = ">= 5.0.0"
    }
  }
}

# compute
resource "oci_core_instance" "ubuntu_instance" {
    availability_domain = "${var.instance_availability_domain}"
    compartment_id = "${var.compartment_id}"
    shape = "VM.Standard.E4.Flex"
    create_vnic_details {
        display_name = "${var.display_vnic_name}"
        assign_public_ip = true
        subnet_id = "${var.subnet_ocid}"
    }
    display_name = "${var.display_instance_name}"
    
    shape_config {
        baseline_ocpu_utilization = "BASELINE_1_2"
        memory_in_gbs = 64
        ocpus = 2
    }
    source_details {
        source_id = "${var.source_ocid}"
        source_type = "image"
        boot_volume_size_in_gbs = 100
    }
    preserve_boot_volume = false
    metadata = {
        ssh_authorized_keys = file("${var.public_ssh_key_path}")

        user_data = "${base64encode(file("./modules/compute/instance_init/install_init.yaml"))}"
    }
}

```


## 2. Computeへの自動インストール
cloud-initを使いComputeに対して初期インストールを行っています。`install_init.yaml`ファイルの中にインストール手順が記載されています。

ファイル場所
`cn_study_tutor_repository/2_iac/compute/modules/compute/instance_init/install_init.yaml`

```sh
#cloud-config
timezone: Asia/Tokyo
locale: ja_JP.utf8
package_update: true
package_upgrade: true
packages:
    - apt-transport-https
    - ca-certificates
    - curl
    - software-properties-common
    - gnupg

final_message: "######### Final Message ########"

runcmd:
    # docker install
    - echo 'docker Install'
    - sudo apt-get -y update
    - sudo apt-get -y install ca-certificates curl
    - sudo install -m 0755 -d /etc/apt/keyrings
    - sudo curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" -o /etc/apt/keyrings/docker.asc
    - sudo chmod a+r /etc/apt/keyrings/docker.asc

    - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] "https://download.docker.com/linux/ubuntu" $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    - sudo apt-get -y update
    - sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    - echo 'docker Finish'

    
    # kubectl install
    - echo 'kubectl Install'
    - curl -LO "https://dl.k8s.io/release/v1.29.1/bin/linux/amd64/kubectl"
    - chmod +x ./kubectl
    - sudo mv ./kubectl /usr/local/bin/kubectl
    - kubectl version --client
    - echo 'kubectl Finish'
    
    # oci-cli install
    - echo 'oci-cli Install'
    - apt update -y
    - apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
    - apt update -y
    - apt install python3 
    - apt -y install python3-pip
    - apt -y install python3-venv
    - python3 -m venv oracle-cli
    - source oracle-cli/bin/activate
    - pip install oci-cli
    - echo 'oci-cli Finish'

    # fn project
    - echo 'fn project Install'
    - curl -LSs "https://raw.githubusercontent.com/fnproject/cli/master/install" | sh
    - echo 'fn project Finish'


```

インストールの終了確認は、`/var/log/cloud-init-output.log`か`/var/log/cloud-init.log`で確認できます。
