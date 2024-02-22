module "vcn" {
    source = "./modules/vcn"

    compartment_id = var.compartment_id
    vcn_display_name = var.vcn_display_name
}

module "mysql_container_instance" {
    source = "./modules/container_instance"

    compartment_id = var.compartment_id
    subnet_ocid = module.vcn.public_subnet_id

    # wordpress
    wordpress_db_user = var.wordpress_db_user
    wordpress_db_password = var.wordpress_db_password
    wordpress_db_name = var.wordpress_db_name

    # mysql
    mysql_root_password = var.mysql_root_password
    mysql_user = var.mysql_user
    mysql_password = var.mysql_password
    mysql_database = var.mysql_database
}



