terraform {
  required_version = "<= 0.11.10"
}

locals {
  availability_zone = "${var.availability_zone != "" ? var.availability_zone : data.aws_subnet.default.availability_zone}"

  compose_instance_name = "${var.ec2_instance_name}"

  common_tags = {
    Tier         = "${var.instance_tier}"
    Organization = "${var.instance_organization}"
    Terraform    = "true"
  }
}

data "aws_region" "default" {}

data "aws_subnet" "default" {
  id = "${var.subnet}"
}

resource "aws_instance" "this" {
  count = "${var.create_ec2_instance ? var.instance_count : 0}"

  ami                                  = "${var.ec2_instance_ami}"
  availability_zone                    = "${local.availability_zone}"
  subnet_id                            = "${data.aws_subnet.default.id}"
  instance_type                        = "${var.ec2_instance_type}"
  key_name                             = "${var.instance_key_name}"
  ebs_optimized                        = "${var.ebs_optimized}"
  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  monitoring                           = "${var.monitoring_enabled}"
  associate_public_ip_address          = "${var.associate_public_ip_address}"
  private_ip                           = "${var.private_ip}"
  source_dest_check                    = "${var.source_dest_check}"
  user_data                            = "${var.user_data}"
  iam_instance_profile                 = "${var.iam_instance_profile}"
  ipv6_address_count                   = "${var.ipv6_address_count}"
  ipv6_addresses                       = "${var.ipv6_addresses}"

  vpc_security_group_ids = ["${var.security_groups_ids}"]

  root_block_device {
    volume_type           = "${var.root_block_type}"
    volume_size           = "${var.root_block_size}"
    iops                  = "${var.root_block_iops}"
    delete_on_termination = "${var.root_block_delete_on_termination}"
  }

  volume_tags = "${merge(var.tags, local.common_tags, map("Name", var.ec2_instance_name))}"

  tags = "${merge(var.tags, local.common_tags, map("Name", local.compose_instance_name))}"
}
