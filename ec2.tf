provider "aws" {
	}
resource "aws_instance" "inst1-andrei-kosach" {
	ami = "ami-0dcc0ebde7b2e00db"
	instance_type = "t2.micro"
	security_groups = flatten (["epam-by-ru"])
	key_name = "adnrei_kosach"
        availability_zone = "eu-central-1a"
	tags = {
		owner = "andrei_kosach@epam.com"
		Name = "inst1-andrei-kosach"
	}
	volume_tags = {
                owner = "andrei_kosach@epam.com"
               Name = "inst1-andrei-kosach"
        }    
}

resource "aws_instance" "inst2-andrei-kosach" {
        ami = "ami-0dcc0ebde7b2e00db"
        instance_type = "t2.micro"
        security_groups = flatten (["epam-by-ru"])
        key_name = "adnrei_kosach"
        availability_zone = "eu-central-1b"
        tags = {
                owner = "andrei_kosach@epam.com"
                Name = "inst2-andrei-kosach"
        }
        volume_tags = {
                owner = "andrei_kosach@epam.com"
               Name = "inst2-andrei-kosach"
        }
}