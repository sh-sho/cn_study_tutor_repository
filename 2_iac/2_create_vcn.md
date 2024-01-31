# VCNウィザードから作成できるVCN相当のものをTerraformで作成する

作成するリソース
- VCN
- Subnet
- Security List
- Internet Gateway
- Route table
- NAT Gateway
- Service Gateway

### Let's THINK!!

1. VCNとSubnetを同時に作成する場合、どのようにしてVCN情報をSubnetに渡しているでしょうか？
2. Defaultで作成されるSecurity List、Subnetなどを変更するには、どのようにTerraformを記載すればいいでしょうか？
3. moduleを使用した場合、構成はどうなるでしょうか？ [moduleのmain.tf](./vcn/module/main.tf)

### Terraform設定ファイル

- VCNを作成するためのリソース情報を記載：  [main.tf](./vcn/nomodule/main.tf)
- `terraform apply`実行後の出力結果で表示する項目を記載：  [outputs.tf](./vcn/nomodule/outputs.tf)
- OCIへアクセスするためのプロバイダー情報を記載：  [provider.tf](./vcn/nomodule/provider.tf)
- 変数として使用する情報を記載：  [variables.tf](./vcn/nomodule/variables.tf)

※ OCIのテナンシーOCID、ユーザーOCID、APIキーの情報を記載したterraform.tfvarsは記載していない

`terraform.tfvars`
```yaml
tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
user_ocid="ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx"
private_key_path="/home/opc/.ssh/xxxxxxx.pem"
fingerprint="XX:XX:ab:88:ef:17:89:79:0d:XX:XX:XX:XX:XX:XX:XX"
region="ap-tokyo-1"
compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx"
```

### (実行例)terraform init
```console
[opc@test-vm1 vcn]$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of oracle/oci from the dependency lock file
- Using previously-installed oracle/oci v5.26.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### (実行例)terraform plan

```console
[opc@test-vm1 vcn]$ terraform plan
data.oci_core_services.all_oci_services: Reading...
data.oci_core_services.all_oci_services: Read complete after 1s [id=CoreServicesDataSource-0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # oci_core_default_route_table.route_table_service_gateway will be created
  + resource "oci_core_default_route_table" "route_table_service_gateway" {
      + compartment_id             = (known after apply)
      + defined_tags               = (known after apply)
      + display_name               = "route_table_private"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + manage_default_resource_id = (known after apply)
      + state                      = (known after apply)
      + time_created               = (known after apply)

      + route_rules {
          + cidr_block        = (known after apply)
          + description       = (known after apply)
          + destination       = "0.0.0.0/0"
          + destination_type  = "CIDR_BLOCK"
          + network_entity_id = (known after apply)
          + route_type        = (known after apply)
        }
      + route_rules {
          + cidr_block        = (known after apply)
          + description       = (known after apply)
          + destination       = "all-nrt-services-in-oracle-services-network"
          + destination_type  = "SERVICE_CIDR_BLOCK"
          + network_entity_id = (known after apply)
          + route_type        = (known after apply)
        }
    }

  # oci_core_default_security_list.public_security_list will be created
  + resource "oci_core_default_security_list" "public_security_list" {
      + compartment_id             = (known after apply)
      + defined_tags               = (known after apply)
      + display_name               = "public_security_list"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + manage_default_resource_id = (known after apply)
      + state                      = (known after apply)
      + time_created               = (known after apply)

      + egress_security_rules {
          + description      = (known after apply)
          + destination      = "0.0.0.0/0"
          + destination_type = (known after apply)
          + protocol         = "all"
          + stateless        = (known after apply)
        }

      + ingress_security_rules {
          + description = (known after apply)
          + protocol    = "6"
          + source      = "0.0.0.0/0"
          + source_type = (known after apply)
          + stateless   = false

          + tcp_options {
              + max = 22
              + min = 22
            }
        }
    }

  # oci_core_internet_gateway.internet_gateway will be created
  + resource "oci_core_internet_gateway" "internet_gateway" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "internet_gateway"
      + enabled        = true
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)
    }

  # oci_core_nat_gateway.nat_gateway will be created
  + resource "oci_core_nat_gateway" "nat_gateway" {
      + block_traffic  = (known after apply)
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "nat_gateway"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + nat_ip         = (known after apply)
      + public_ip_id   = (known after apply)
      + route_table_id = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)
    }

  # oci_core_route_table.route_table_public will be created
  + resource "oci_core_route_table" "route_table_public" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "route_table_public"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)

      + route_rules {
          + cidr_block        = (known after apply)
          + description       = (known after apply)
          + destination       = "0.0.0.0/0"
          + destination_type  = "CIDR_BLOCK"
          + network_entity_id = (known after apply)
          + route_type        = (known after apply)
        }
    }

  # oci_core_security_list.private_security_list will be created
  + resource "oci_core_security_list" "private_security_list" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "private_security_list"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)

      + egress_security_rules {
          + description      = (known after apply)
          + destination      = "0.0.0.0/0"
          + destination_type = (known after apply)
          + protocol         = "all"
          + stateless        = (known after apply)
        }

      + ingress_security_rules {
          + description = (known after apply)
          + protocol    = "6"
          + source      = "10.0.0.0/16"
          + source_type = (known after apply)
          + stateless   = false

          + tcp_options {
              + max = 443
              + min = 443
            }
        }
    }

  # oci_core_service_gateway.service_gateway will be created
  + resource "oci_core_service_gateway" "service_gateway" {
      + block_traffic  = (known after apply)
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "service_gateway"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)

      + services {
          + service_id   = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          + service_name = (known after apply)
        }
    }

  # oci_core_subnet.private_subnet will be created
  + resource "oci_core_subnet" "private_subnet" {
      + availability_domain        = (known after apply)
      + cidr_block                 = "10.0.1.0/24"
      + compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags               = (known after apply)
      + dhcp_options_id            = (known after apply)
      + display_name               = "private_subnet"
      + dns_label                  = "private"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + ipv6cidr_block             = (known after apply)
      + ipv6cidr_blocks            = (known after apply)
      + ipv6virtual_router_ip      = (known after apply)
      + prohibit_internet_ingress  = (known after apply)
      + prohibit_public_ip_on_vnic = true
      + route_table_id             = (known after apply)
      + security_list_ids          = (known after apply)
      + state                      = (known after apply)
      + subnet_domain_name         = (known after apply)
      + time_created               = (known after apply)
      + vcn_id                     = (known after apply)
      + virtual_router_ip          = (known after apply)
      + virtual_router_mac         = (known after apply)
    }

  # oci_core_subnet.public_subnet will be created
  + resource "oci_core_subnet" "public_subnet" {
      + availability_domain        = (known after apply)
      + cidr_block                 = "10.0.2.0/24"
      + compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags               = (known after apply)
      + dhcp_options_id            = (known after apply)
      + display_name               = "public_subnet"
      + dns_label                  = "public"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + ipv6cidr_block             = (known after apply)
      + ipv6cidr_blocks            = (known after apply)
      + ipv6virtual_router_ip      = (known after apply)
      + prohibit_internet_ingress  = (known after apply)
      + prohibit_public_ip_on_vnic = false
      + route_table_id             = (known after apply)
      + security_list_ids          = (known after apply)
      + state                      = (known after apply)
      + subnet_domain_name         = (known after apply)
      + time_created               = (known after apply)
      + vcn_id                     = (known after apply)
      + virtual_router_ip          = (known after apply)
      + virtual_router_mac         = (known after apply)
    }

  # oci_core_vcn.generated_oci_core_vcn will be created
  + resource "oci_core_vcn" "generated_oci_core_vcn" {
      + byoipv6cidr_blocks               = (known after apply)
      + cidr_block                       = (known after apply)
      + cidr_blocks                      = [
          + "10.0.0.0/16",
        ]
      + compartment_id                   = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + default_dhcp_options_id          = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_list_id         = (known after apply)
      + defined_tags                     = (known after apply)
      + display_name                     = "VCN_TEST"
      + dns_label                        = "vcntest"
      + freeform_tags                    = (known after apply)
      + id                               = (known after apply)
      + ipv6cidr_blocks                  = (known after apply)
      + ipv6private_cidr_blocks          = (known after apply)
      + is_ipv6enabled                   = false
      + is_oracle_gua_allocation_enabled = (known after apply)
      + state                            = (known after apply)
      + time_created                     = (known after apply)
      + vcn_domain_name                  = (known after apply)
    }

Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cidr_blocks              = [
      + "10.0.0.0/16",
    ]
  + default_dhcp_options_id  = (known after apply)
  + default_route_table      = [
      + (known after apply),
    ]
  + default_route_table_id   = (known after apply)
  + default_security_list_id = (known after apply)
  + display_name             = "VCN_TEST"
  + dns_label                = "vcntest"
  + oci_core_services        = [
      + {
          + cidr_block  = "all-nrt-services-in-oracle-services-network"
          + description = "All NRT Services In Oracle Services Network"
          + id          = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          + name        = "All NRT Services In Oracle Services Network"
        },
    ]
  + private_security_list    = [
      + (known after apply),
    ]
  + vcn_id                   = (known after apply)

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

```

### (実行例)terraform apply
```console
[opc@test-vm1 vcn]$ terraform apply
data.oci_core_services.all_oci_services: Reading...
data.oci_core_services.all_oci_services: Read complete after 0s [id=CoreServicesDataSource-0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # oci_core_default_route_table.route_table_service_gateway will be created
  + resource "oci_core_default_route_table" "route_table_service_gateway" {
      + compartment_id             = (known after apply)
      + defined_tags               = (known after apply)
      + display_name               = "route_table_private"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + manage_default_resource_id = (known after apply)
      + state                      = (known after apply)
      + time_created               = (known after apply)

      + route_rules {
          + cidr_block        = (known after apply)
          + description       = (known after apply)
          + destination       = "0.0.0.0/0"
          + destination_type  = "CIDR_BLOCK"
          + network_entity_id = (known after apply)
          + route_type        = (known after apply)
        }
      + route_rules {
          + cidr_block        = (known after apply)
          + description       = (known after apply)
          + destination       = "all-nrt-services-in-oracle-services-network"
          + destination_type  = "SERVICE_CIDR_BLOCK"
          + network_entity_id = (known after apply)
          + route_type        = (known after apply)
        }
    }

  # oci_core_default_security_list.public_security_list will be created
  + resource "oci_core_default_security_list" "public_security_list" {
      + compartment_id             = (known after apply)
      + defined_tags               = (known after apply)
      + display_name               = "public_security_list"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + manage_default_resource_id = (known after apply)
      + state                      = (known after apply)
      + time_created               = (known after apply)

      + egress_security_rules {
          + description      = (known after apply)
          + destination      = "0.0.0.0/0"
          + destination_type = (known after apply)
          + protocol         = "all"
          + stateless        = (known after apply)
        }

      + ingress_security_rules {
          + description = (known after apply)
          + protocol    = "6"
          + source      = "0.0.0.0/0"
          + source_type = (known after apply)
          + stateless   = false

          + tcp_options {
              + max = 22
              + min = 22
            }
        }
    }

  # oci_core_internet_gateway.internet_gateway will be created
  + resource "oci_core_internet_gateway" "internet_gateway" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "internet_gateway"
      + enabled        = true
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)
    }

  # oci_core_nat_gateway.nat_gateway will be created
  + resource "oci_core_nat_gateway" "nat_gateway" {
      + block_traffic  = (known after apply)
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "nat_gateway"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + nat_ip         = (known after apply)
      + public_ip_id   = (known after apply)
      + route_table_id = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)
    }

  # oci_core_route_table.route_table_public will be created
  + resource "oci_core_route_table" "route_table_public" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "route_table_public"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)

      + route_rules {
          + cidr_block        = (known after apply)
          + description       = (known after apply)
          + destination       = "0.0.0.0/0"
          + destination_type  = "CIDR_BLOCK"
          + network_entity_id = (known after apply)
          + route_type        = (known after apply)
        }
    }

  # oci_core_security_list.private_security_list will be created
  + resource "oci_core_security_list" "private_security_list" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "private_security_list"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)

      + egress_security_rules {
          + description      = (known after apply)
          + destination      = "0.0.0.0/0"
          + destination_type = (known after apply)
          + protocol         = "all"
          + stateless        = (known after apply)
        }

      + ingress_security_rules {
          + description = (known after apply)
          + protocol    = "6"
          + source      = "10.0.0.0/16"
          + source_type = (known after apply)
          + stateless   = false

          + tcp_options {
              + max = 443
              + min = 443
            }
        }
    }

  # oci_core_service_gateway.service_gateway will be created
  + resource "oci_core_service_gateway" "service_gateway" {
      + block_traffic  = (known after apply)
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags   = (known after apply)
      + display_name   = "service_gateway"
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + state          = (known after apply)
      + time_created   = (known after apply)
      + vcn_id         = (known after apply)

      + services {
          + service_id   = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          + service_name = (known after apply)
        }
    }

  # oci_core_subnet.private_subnet will be created
  + resource "oci_core_subnet" "private_subnet" {
      + availability_domain        = (known after apply)
      + cidr_block                 = "10.0.1.0/24"
      + compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags               = (known after apply)
      + dhcp_options_id            = (known after apply)
      + display_name               = "private_subnet"
      + dns_label                  = "private"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + ipv6cidr_block             = (known after apply)
      + ipv6cidr_blocks            = (known after apply)
      + ipv6virtual_router_ip      = (known after apply)
      + prohibit_internet_ingress  = (known after apply)
      + prohibit_public_ip_on_vnic = true
      + route_table_id             = (known after apply)
      + security_list_ids          = (known after apply)
      + state                      = (known after apply)
      + subnet_domain_name         = (known after apply)
      + time_created               = (known after apply)
      + vcn_id                     = (known after apply)
      + virtual_router_ip          = (known after apply)
      + virtual_router_mac         = (known after apply)
    }

  # oci_core_subnet.public_subnet will be created
  + resource "oci_core_subnet" "public_subnet" {
      + availability_domain        = (known after apply)
      + cidr_block                 = "10.0.2.0/24"
      + compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + defined_tags               = (known after apply)
      + dhcp_options_id            = (known after apply)
      + display_name               = "public_subnet"
      + dns_label                  = "public"
      + freeform_tags              = (known after apply)
      + id                         = (known after apply)
      + ipv6cidr_block             = (known after apply)
      + ipv6cidr_blocks            = (known after apply)
      + ipv6virtual_router_ip      = (known after apply)
      + prohibit_internet_ingress  = (known after apply)
      + prohibit_public_ip_on_vnic = false
      + route_table_id             = (known after apply)
      + security_list_ids          = (known after apply)
      + state                      = (known after apply)
      + subnet_domain_name         = (known after apply)
      + time_created               = (known after apply)
      + vcn_id                     = (known after apply)
      + virtual_router_ip          = (known after apply)
      + virtual_router_mac         = (known after apply)
    }

  # oci_core_vcn.generated_oci_core_vcn will be created
  + resource "oci_core_vcn" "generated_oci_core_vcn" {
      + byoipv6cidr_blocks               = (known after apply)
      + cidr_block                       = (known after apply)
      + cidr_blocks                      = [
          + "10.0.0.0/16",
        ]
      + compartment_id                   = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      + default_dhcp_options_id          = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_list_id         = (known after apply)
      + defined_tags                     = (known after apply)
      + display_name                     = "VCN_TEST"
      + dns_label                        = "vcntest"
      + freeform_tags                    = (known after apply)
      + id                               = (known after apply)
      + ipv6cidr_blocks                  = (known after apply)
      + ipv6private_cidr_blocks          = (known after apply)
      + is_ipv6enabled                   = false
      + is_oracle_gua_allocation_enabled = (known after apply)
      + state                            = (known after apply)
      + time_created                     = (known after apply)
      + vcn_domain_name                  = (known after apply)
    }

Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cidr_blocks              = [
      + "10.0.0.0/16",
    ]
  + default_dhcp_options_id  = (known after apply)
  + default_route_table      = [
      + (known after apply),
    ]
  + default_route_table_id   = (known after apply)
  + default_security_list_id = (known after apply)
  + display_name             = "VCN_TEST"
  + dns_label                = "vcntest"
  + oci_core_services        = [
      + {
          + cidr_block  = "all-nrt-services-in-oracle-services-network"
          + description = "All NRT Services In Oracle Services Network"
          + id          = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          + name        = "All NRT Services In Oracle Services Network"
        },
    ]
  + private_security_list    = [
      + (known after apply),
    ]
  + vcn_id                   = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

oci_core_vcn.generated_oci_core_vcn: Creating...
oci_core_vcn.generated_oci_core_vcn: Creation complete after 0s [id=ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_service_gateway.service_gateway: Creating...
oci_core_internet_gateway.internet_gateway: Creating...
oci_core_security_list.private_security_list: Creating...
oci_core_default_security_list.public_security_list: Creating...
oci_core_nat_gateway.nat_gateway: Creating...
oci_core_security_list.private_security_list: Creation complete after 1s [id=ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_security_list.public_security_list: Creation complete after 1s [id=ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_internet_gateway.internet_gateway: Creation complete after 1s [id=ocid1.internetgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_route_table.route_table_public: Creating...
oci_core_service_gateway.service_gateway: Creation complete after 1s [id=ocid1.servicegateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_route_table.route_table_public: Creation complete after 0s [id=ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.public_subnet: Creating...
oci_core_nat_gateway.nat_gateway: Creation complete after 2s [id=ocid1.natgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_route_table.route_table_service_gateway: Creating...
oci_core_default_route_table.route_table_service_gateway: Creation complete after 0s [id=ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.private_subnet: Creating...
oci_core_subnet.public_subnet: Creation complete after 2s [id=ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.private_subnet: Creation complete after 3s [id=ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

cidr_blocks = tolist([
  "10.0.0.0/16",
])
default_dhcp_options_id = "ocid1.dhcpoptions.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
default_route_table = [
  "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaarh2jpfd3ayy6pslxrzmwb3bvbqfaclicxbtlxno7tdh5lpkembnq",
]
default_route_table_id = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
default_security_list_id = "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
display_name = "VCN_TEST"
dns_label = "vcntest"
oci_core_services = tolist([
  {
    "cidr_block" = "all-nrt-services-in-oracle-services-network"
    "description" = "All NRT Services In Oracle Services Network"
    "id" = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    "name" = "All NRT Services In Oracle Services Network"
  },
])
private_security_list = [
  "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
]
vcn_id = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

```


### (実行例)terraform destroy
```console
[opc@test-vm1 vcn]$ terraform destroy
data.oci_core_services.all_oci_services: Reading...
oci_core_vcn.generated_oci_core_vcn: Refreshing state... [id=ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
data.oci_core_services.all_oci_services: Read complete after 0s [id=CoreServicesDataSource-0]
oci_core_nat_gateway.nat_gateway: Refreshing state... [id=ocid1.natgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_service_gateway.service_gateway: Refreshing state... [id=ocid1.servicegateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_security_list.private_security_list: Refreshing state... [id=ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_internet_gateway.internet_gateway: Refreshing state... [id=ocid1.internetgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_security_list.public_security_list: Refreshing state... [id=ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_route_table.route_table_public: Refreshing state... [id=ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_route_table.route_table_service_gateway: Refreshing state... [id=ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.public_subnet: Refreshing state... [id=ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.private_subnet: Refreshing state... [id=ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # oci_core_default_route_table.route_table_service_gateway will be destroyed
  - resource "oci_core_default_route_table" "route_table_service_gateway" {
      - compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags               = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:25.963Z"
        } -> null
      - display_name               = "route_table_private" -> null
      - freeform_tags              = {} -> null
      - id                         = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - manage_default_resource_id = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state                      = "AVAILABLE" -> null
      - time_created               = "2024-01-31 06:09:26.042 +0000 UTC" -> null

      - route_rules {
          - destination       = "0.0.0.0/0" -> null
          - destination_type  = "CIDR_BLOCK" -> null
          - network_entity_id = "ocid1.natgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
        }
      - route_rules {
          - destination       = "all-nrt-services-in-oracle-services-network" -> null
          - destination_type  = "SERVICE_CIDR_BLOCK" -> null
          - network_entity_id = "ocid1.servicegateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
        }
    }

  # oci_core_default_security_list.public_security_list will be destroyed
  - resource "oci_core_default_security_list" "public_security_list" {
      - compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags               = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:25.963Z"
        } -> null
      - display_name               = "public_security_list" -> null
      - freeform_tags              = {} -> null
      - id                         = "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - manage_default_resource_id = "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state                      = "AVAILABLE" -> null
      - time_created               = "2024-01-31 06:09:26.042 +0000 UTC" -> null

      - egress_security_rules {
          - destination      = "0.0.0.0/0" -> null
          - destination_type = "CIDR_BLOCK" -> null
          - protocol         = "all" -> null
          - stateless        = false -> null
        }

      - ingress_security_rules {
          - protocol    = "6" -> null
          - source      = "0.0.0.0/0" -> null
          - source_type = "CIDR_BLOCK" -> null
          - stateless   = false -> null

          - tcp_options {
              - max = 22 -> null
              - min = 22 -> null
            }
        }
    }

  # oci_core_internet_gateway.internet_gateway will be destroyed
  - resource "oci_core_internet_gateway" "internet_gateway" {
      - compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags   = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:26.555Z"
        } -> null
      - display_name   = "internet_gateway" -> null
      - enabled        = true -> null
      - freeform_tags  = {} -> null
      - id             = "ocid1.internetgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state          = "AVAILABLE" -> null
      - time_created   = "2024-01-31 06:09:26.599 +0000 UTC" -> null
      - vcn_id         = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
    }

  # oci_core_nat_gateway.nat_gateway will be destroyed
  - resource "oci_core_nat_gateway" "nat_gateway" {
      - block_traffic  = false -> null
      - compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags   = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:26.582Z"
        } -> null
      - display_name   = "nat_gateway" -> null
      - freeform_tags  = {} -> null
      - id             = "ocid1.natgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - nat_ip         = "141.147.188.162" -> null
      - public_ip_id   = "ocid1.publicip.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state          = "AVAILABLE" -> null
      - time_created   = "2024-01-31 06:09:26.958 +0000 UTC" -> null
      - vcn_id         = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
    }

  # oci_core_route_table.route_table_public will be destroyed
  - resource "oci_core_route_table" "route_table_public" {
      - compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags   = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:26.985Z"
        } -> null
      - display_name   = "route_table_public" -> null
      - freeform_tags  = {} -> null
      - id             = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state          = "AVAILABLE" -> null
      - time_created   = "2024-01-31 06:09:27.004 +0000 UTC" -> null
      - vcn_id         = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null

      - route_rules {
          - destination       = "0.0.0.0/0" -> null
          - destination_type  = "CIDR_BLOCK" -> null
          - network_entity_id = "ocid1.internetgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
        }
    }

  # oci_core_security_list.private_security_list will be destroyed
  - resource "oci_core_security_list" "private_security_list" {
      - compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags   = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:26.560Z"
        } -> null
      - display_name   = "private_security_list" -> null
      - freeform_tags  = {} -> null
      - id             = "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state          = "AVAILABLE" -> null
      - time_created   = "2024-01-31 06:09:26.588 +0000 UTC" -> null
      - vcn_id         = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null

      - egress_security_rules {
          - destination      = "0.0.0.0/0" -> null
          - destination_type = "CIDR_BLOCK" -> null
          - protocol         = "all" -> null
          - stateless        = false -> null
        }

      - ingress_security_rules {
          - protocol    = "6" -> null
          - source      = "10.0.0.0/16" -> null
          - source_type = "CIDR_BLOCK" -> null
          - stateless   = false -> null

          - tcp_options {
              - max = 443 -> null
              - min = 443 -> null
            }
        }
    }

  # oci_core_service_gateway.service_gateway will be destroyed
  - resource "oci_core_service_gateway" "service_gateway" {
      - block_traffic  = false -> null
      - compartment_id = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags   = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:26.500Z"
        } -> null
      - display_name   = "service_gateway" -> null
      - freeform_tags  = {} -> null
      - id             = "ocid1.servicegateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - state          = "AVAILABLE" -> null
      - time_created   = "2024-01-31 06:09:26.871 +0000 UTC" -> null
      - vcn_id         = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null

      - services {
          - service_id   = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
          - service_name = "All NRT Services In Oracle Services Network" -> null
        }
    }

  # oci_core_subnet.private_subnet will be destroyed
  - resource "oci_core_subnet" "private_subnet" {
      - cidr_block                 = "10.0.1.0/24" -> null
      - compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags               = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:27.320Z"
        } -> null
      - dhcp_options_id            = "ocid1.dhcpoptions.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - display_name               = "private_subnet" -> null
      - dns_label                  = "private" -> null
      - freeform_tags              = {} -> null
      - id                         = "ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - ipv6cidr_blocks            = [] -> null
      - prohibit_internet_ingress  = true -> null
      - prohibit_public_ip_on_vnic = true -> null
      - route_table_id             = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - security_list_ids          = [
          - "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        ] -> null
      - state                      = "AVAILABLE" -> null
      - subnet_domain_name         = "private.vcntest.oraclevcn.com" -> null
      - time_created               = "2024-01-31 06:09:28.556 +0000 UTC" -> null
      - vcn_id                     = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - virtual_router_ip          = "10.0.1.1" -> null
      - virtual_router_mac         = "00:00:17:CD:FD:98" -> null
    }

  # oci_core_subnet.public_subnet will be destroyed
  - resource "oci_core_subnet" "public_subnet" {
      - cidr_block                 = "10.0.2.0/24" -> null
      - compartment_id             = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags               = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:27.320Z"
        } -> null
      - dhcp_options_id            = "ocid1.dhcpoptions.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - display_name               = "public_subnet" -> null
      - dns_label                  = "public" -> null
      - freeform_tags              = {} -> null
      - id                         = "ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - ipv6cidr_blocks            = [] -> null
      - prohibit_internet_ingress  = false -> null
      - prohibit_public_ip_on_vnic = false -> null
      - route_table_id             = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - security_list_ids          = [
          - "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        ] -> null
      - state                      = "AVAILABLE" -> null
      - subnet_domain_name         = "public.vcntest.oraclevcn.com" -> null
      - time_created               = "2024-01-31 06:09:27.402 +0000 UTC" -> null
      - vcn_id                     = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - virtual_router_ip          = "10.0.2.1" -> null
      - virtual_router_mac         = "00:00:17:CD:FD:98" -> null
    }

  # oci_core_vcn.generated_oci_core_vcn will be destroyed
  - resource "oci_core_vcn" "generated_oci_core_vcn" {
      - byoipv6cidr_blocks       = [] -> null
      - cidr_block               = "10.0.0.0/16" -> null
      - cidr_blocks              = [
          - "10.0.0.0/16",
        ] -> null
      - compartment_id           = "ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - default_dhcp_options_id  = "ocid1.dhcpoptions.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - default_route_table_id   = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - default_security_list_id = "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - defined_tags             = {
          - "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hoge@hoge.com"
          - "Oracle-Tags.CreatedOn" = "2024-01-31T06:09:25.963Z"
        } -> null
      - display_name             = "VCN_TEST" -> null
      - dns_label                = "vcntest" -> null
      - freeform_tags            = {} -> null
      - id                       = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
      - ipv6cidr_blocks          = [] -> null
      - ipv6private_cidr_blocks  = [] -> null
      - is_ipv6enabled           = false -> null
      - state                    = "AVAILABLE" -> null
      - time_created             = "2024-01-31 06:09:26.042 +0000 UTC" -> null
      - vcn_domain_name          = "vcntest.oraclevcn.com" -> null
    }

Plan: 0 to add, 0 to change, 10 to destroy.

Changes to Outputs:
  - cidr_blocks              = [
      - "10.0.0.0/16",
    ] -> null
  - default_dhcp_options_id  = "ocid1.dhcpoptions.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
  - default_route_table      = [
      - "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    ] -> null
  - default_route_table_id   = "ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
  - default_security_list_id = "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null
  - display_name             = "VCN_TEST" -> null
  - dns_label                = "vcntest" -> null
  - oci_core_services        = [
      - {
          - cidr_block  = "all-nrt-services-in-oracle-services-network"
          - description = "All NRT Services In Oracle Services Network"
          - id          = "ocid1.service.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          - name        = "All NRT Services In Oracle Services Network"
        },
    ] -> null
  - private_security_list    = [
      - "ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    ] -> null
  - vcn_id                   = "ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

oci_core_subnet.public_subnet: Destroying... [id=ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.private_subnet: Destroying... [id=ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_security_list.public_security_list: Destroying... [id=ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_security_list.public_security_list: Destruction complete after 1s
oci_core_subnet.private_subnet: Destruction complete after 1s
oci_core_default_route_table.route_table_service_gateway: Destroying... [id=ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_security_list.private_security_list: Destroying... [id=ocid1.securitylist.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_subnet.public_subnet: Destruction complete after 1s
oci_core_route_table.route_table_public: Destroying... [id=ocid1.routetable.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_security_list.private_security_list: Destruction complete after 0s
oci_core_route_table.route_table_public: Destruction complete after 1s
oci_core_internet_gateway.internet_gateway: Destroying... [id=ocid1.internetgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_default_route_table.route_table_service_gateway: Destruction complete after 1s
oci_core_service_gateway.service_gateway: Destroying... [id=ocid1.servicegateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_nat_gateway.nat_gateway: Destroying... [id=ocid1.natgateway.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_internet_gateway.internet_gateway: Destruction complete after 0s
oci_core_nat_gateway.nat_gateway: Destruction complete after 1s
oci_core_service_gateway.service_gateway: Destruction complete after 3s
oci_core_vcn.generated_oci_core_vcn: Destroying... [id=ocid1.vcn.oc1.ap-tokyo-1.aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
oci_core_vcn.generated_oci_core_vcn: Destruction complete after 1s

Destroy complete! Resources: 10 destroyed.
```

