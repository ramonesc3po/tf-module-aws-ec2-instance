provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "bastion" {
  most_recent = "true"

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
}

output "debug" {
  value = "${data.aws_subnet_ids.default.ids}"
}

resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Security group bastion"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

resource "aws_key_pair" "bastion" {
  key_name   = "bastion"
  public_key = "${file("key/bastion.pub")}"
}

module "bastion" {
  source = "../"

  ec2_instance_name           = "bastion"
  ec2_instance_ami            = "${data.aws_ami.bastion.id}"
  ec2_instance_type           = "t2.micro"
  instance_tier               = "production"
  instance_organization       = "zigzaga"
  instance_key_name           = "${aws_key_pair.bastion.key_name}"
  subnet                      = "${element(data.aws_subnet_ids.default.ids, 0)}"
  associate_public_ip_address = "true"

  security_groups_ids = ["${aws_security_group.bastion.id}"]
}
