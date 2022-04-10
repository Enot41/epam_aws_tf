resource "aws_lb_target_group" "tg-lb-andrei-kosach" {
    name     = "tg-lb-andrei-kosach"
    port     = 80
    protocol = "HTTP"
    vpc_id   = "vpc-6c6dfe06"
    target_type = "instance"
        tags = {
                owner = "andrei_kosach@epam.com"
                Name = "tg-lb-andrei-kosach"
        }
}
resource "aws_lb_target_group_attachment" "tg-lb-at1-andrei-kosach" {
    target_group_arn = aws_lb_target_group.tg-lb-andrei-kosach.arn
    target_id        = aws_instance.inst1-andrei-kosach.id
    port = 80
}
resource "aws_lb_target_group_attachment" "tg-lb-at2-andrei-kosach" {
    target_group_arn = aws_lb_target_group.tg-lb-andrei-kosach.arn
    target_id        = aws_instance.inst2-andrei-kosach.id
    port = 80
}
resource "aws_lb" "lb-andrei-kosach" {
    name               = "lb-andrei-kosach"
    internal = false
    # subnets = flatten (["subnet-dc4a30b6"])
    security_groups    = flatten (["sg-0a8b5db2a7dcca42a"])
    load_balancer_type = "application"
    ip_address_type = "ipv4"
    subnet_mapping {
        # allocation_id= "en-central-1a"
        subnet_id = "subnet-dc4a30b6"
    }
    subnet_mapping {
        # allocation_id= "en-central-1b"
        subnet_id = "subnet-2965d455"
    }
    tags = {
        owner = "andrei_kosach@epam.com"
        Name = "lb-andrei-kosach"
    }
}
resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = "${aws_lb.lb-andrei-kosach.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = "${aws_lb_target_group.tg-lb-andrei-kosach.arn}"
    type             = "forward"
  }
}