resource "aws_efs_file_system" "efs-andrei-kosach" {
	encrypted = "true"
	tags =  {
    		Name = "efs-andrei-kosach"
		owner = "andrei_kosach@epam.com"
  	}
}
resource "aws_efs_mount_target" "mount1" {
  	file_system_id = aws_efs_file_system.efs-andrei-kosach.id
	subnet_id	= "subnet-2965d455"
	security_groups = flatten (["sg-0a8b5db2a7dcca42a"])
}
resource "aws_efs_mount_target" "mount2" {
        file_system_id = aws_efs_file_system.efs-andrei-kosach.id
        subnet_id       = "subnet-dc4a30b6"
        security_groups = flatten (["sg-0a8b5db2a7dcca42a"])
}