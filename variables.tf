variable "create_ec2_instance" {
  description = "Ensure that the instance will be created"
  default     = true
}

variable "ec2_instance_ami" {
  description = "(Required) The AMI to use for the instance. "
}

variable "availability_zone" {
  description = "(Optional) The AZ to start the instance in."
  default     = ""
}

variable "ec2_instance_type" {
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "subnet" {
  description = "(Optional) The VPC Subnet ID to launch in."
}

variable "instance_key_name" {
  description = "The key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair"
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information"
  default     = false
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  description = "(Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information."
  default     = "stop"
}

variable "monitoring_enabled" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)"
  default     = true
}

variable "security_groups_ids" {
  description = "(Optional, VPC only) A list of security group IDs to associate with. "
  type        = "list"
}

variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value."
  default     = false
}

variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC."
  default     = ""
}

variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true."
  default     = true
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  default     = ""
}

variable "iam_instance_profile" {
  description = "(Optional) The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole."
  default     = ""
}

variable "ipv6_address_count" {
  description = "(Optional) A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
  default     = "0"
}

variable "ipv6_addresses" {
  description = "(Optional) Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  type        = "list"
  default     = []
}

variable "root_block_type" {
  description = "(Optional) The type of volume. Can be standard, gp2, io1, sc1, or st1. (Default: standard)."
  default     = "standard"
}

variable "root_block_size" {
  description = "(Optional) The size of the volume in gibibytes (GiB)."
  default     = "12"
}

variable "root_block_iops" {
  description = "(Optional) The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
  default     = "0"
}

variable "root_block_delete_on_termination" {
  description = "(Optional) Whether the volume should be destroyed on instance termination (Default: true)."
  default     = false
}

variable "tags" {
  description = "Extra tags"
  type        = "map"
  default     = {}
}

variable "ec2_instance_name" {
  description = "(Required) Define the ec2 instance name"
}

variable "instance_tier" {
  description = "(Required) Define the instance tier"
}

variable "instance_organization" {
  description = "Define the ec2 instance organization"
  default = ""
}

variable "instance_count" {
  description = ""
  default     = "1"
}
