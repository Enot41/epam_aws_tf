resource "null_resource" "configure_inst1-andrei-kosach" {
	depends_on = [template_file.get_var]
	connection {
		type     = "ssh"
		user     = "ec2-user"
		private_key = file("ansible/adnrei_kosach.pem")
		host     = aws_instance.inst1-andrei-kosach.public_ip
	}
	provisioner "local-exec" {
    	command = "ansible-playbook -u ec2-user -i '${aws_instance.inst1-andrei-kosach.public_ip},' --key-file ansible/adnrei_kosach.pem ansible/config_ec2.yml"
	}
}
resource "null_resource" "configure_inst2andrei-kosach" {
	depends_on = [template_file.get_var]
	connection {
		type     = "ssh"
		user     = "ec2-user"
		private_key = file("ansible/adnrei_kosach.pem")
		host     = aws_instance.inst2-andrei-kosach.public_ip
	}
	provisioner "local-exec" {
    	command = "ansible-playbook -u ec2-user -i '${aws_instance.inst2-andrei-kosach.public_ip},' --key-file ansible/adnrei_kosach.pem ansible/config_ec2.yml"
	}
}