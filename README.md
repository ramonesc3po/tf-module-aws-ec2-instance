Terraform module aws ec2 instance
=========

This module was created to create linux instances being used for services and creations of bastion instances

Requirements
------------

- Terraform 0.11.10

Required Inputs
--------------
```
ec2_instance_name = ""
ec2_instance_ami = ""
ec2_instance_type = ""
instance_key_name = ""
subnet = ""
security_groups_ids = ""
```
Example Terraform
----------------
```
module "bastion" {
  source = "../"

  ec2_instance_name = "bastion"
  ec2_instance_ami  = "${data.aws_ami.bastion.id}"
  ec2_instance_type = "t2.micro"
  instance_key_name = "${aws_key_pair.bastion.key_name}"
  subnet            = "${element(data.aws_subnet_ids, 0)}"

  security_groups_ids = "${aws_security_group.bastion.id}"
}
```
License
-------
BSD

Author Information
------------------
Ramon Salado