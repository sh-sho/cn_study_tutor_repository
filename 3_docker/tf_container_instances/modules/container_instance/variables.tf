variable "compartment_id" {
    type = string
}

variable "container_instance_display_name" {
    type = string
    default = "tf_container_instance"
}

variable "wordpress_display_name" {
    type = string
    default = "wordpress_container"
}

variable "wordpress_db_user" {
    type = string
}

variable "wordpress_db_password" {
    type = string
}

variable "wordpress_db_name" {
    type = string
}
variable "mysql_display_name" {
    type = string
    default = "mysql_container"
}

variable "mysql_root_password" {
    type = string
}

variable "mysql_user" {
    type = string
}

variable "mysql_password" {
    type = string
}

variable "mysql_database" {
    type = string
}

variable "subnet_ocid" {
    type = string
}

variable "display_vnic_name" {
    type = string
    default = "mysql_ci_vnic"
}

variable "mysql_volumes_name" {
    type = string
    default = "db_data"
}


