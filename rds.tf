resource "aws_db_instance" "rds-andrei-kosach" {
        identifier = var.rds["rds_name"]
        allocated_storage    = 10
        engine               = "mysql"
        engine_version       = "8.0.28"
        instance_class       = "db.t2.micro"
        db_name              = var.rds["db_name"]
        username             = var.rds["db_username"]
        password             = var.rds["db_password"]
        parameter_group_name = "default.mysql8.0"
        option_group_name = "default:mysql-8-0"
        vpc_security_group_ids = flatten (["sg-0a8b5db2a7dcca42a"])
        tags = {
                owner = "andrei_kosach@epam.com"
                Name = var.rds["rds_name"]
        }
        availability_zone = "eu-central-1a"
        skip_final_snapshot = "true"
}