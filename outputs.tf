output "private_ip" {
  description = "Private IP of instance"
  value       = "${join("", aws_instance.this.*.private_ip)}"
}

output "public_ip" {
  description = "Public IP of instance"
  value       = "${join("", aws_instance.this.*.public_ip)}"
}

output "instance_arn" {
  description = "ARN of instance"
  value       = "${join("", aws_instance.this.*.arn)}"
}

output "instance_id" {
  description = "ID of instance"
  value       = "${join("", aws_instance.this.*.id)}"
}

output "root_block_id" {
  description = "ID of root block instance"
  value       = "${join("", aws_instance.this.root_block_device.*.volume_id)}"
}

output "root_block_size" {
  description = "Size of root block instance"
  value       = "${join("", aws_instance.this.root_block_device.*.volume_size)}"
}

output "root_block_type" {
  description = "Type of root block instance"
  value       = "${join("", aws_instance.this.root_block_device.*.volume_type)}"
}
