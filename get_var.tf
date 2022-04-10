resource "template_file" "get_var" {
        template = "${file("${path.module}/ansible/var.tpl")}"
        vars = {
                inst1 = "${aws_instance.inst1-andrei-kosach.public_ip}"
                inst2 = "${aws_instance.inst2-andrei-kosach.public_ip}"
                rds_name = "${aws_db_instance.rds-andrei-kosach.endpoint}"
                efs_name = "${aws_efs_file_system.efs-andrei-kosach.dns_name}"
                lb_dns_name = "${aws_lb.lb-andrei-kosach.dns_name}"
                db_username = "${aws_db_instance.rds-andrei-kosach.username}"
                db_password = "${aws_db_instance.rds-andrei-kosach.password}"
                db_name = "${aws_db_instance.rds-andrei-kosach.db_name}"
        }
}
resource "local_file" "get_var" {
    content  = "${template_file.get_var.rendered}"
    filename = "ansible/var.yml"
}