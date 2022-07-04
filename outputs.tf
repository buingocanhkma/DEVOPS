output "instance_dns" {
  value = aws_route53_record.ec2_instance_dns.*.name
}

output "instance_id" {
  description = "List of IDs of instances"
  value       = aws_instance.ec2_instance.*.id
}

output "instance_subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = aws_instance.ec2_instance.*.subnet_id
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.ec2_instance.*.private_ip
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.ec2_instance.*.public_ip
}
