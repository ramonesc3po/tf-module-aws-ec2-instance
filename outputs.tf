output "private_ip" {
  description = "Private IP of instance"
  value       = "${aws_instance.this.*.private_ip}"
}

output "public_ip" {
  description = "Public IP of instance"
  value       = "${aws_instance.this.*.public_ip}"
}

output "instance_arn" {
  description = "ARN of instance"
  value       = "${aws_instance.this.*.arn}"
}

output "instance_id" {
  description = "ID of instance"
  value       = "${aws_instance.this.*.id}"
}
