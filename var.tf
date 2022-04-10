variable "rds" {
        type = map
        default = {
                "rds_name" = "rds-andrei-kosach"
                "db_name"  = "wordpress"
                "db_username"  = "admin"
                "db_password"  = "wordpress-pass"
        }
}