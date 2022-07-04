resource "aws_route53_record" "ec2_instance_dns" {
  count           = var.instance_count > 0 && var.enable_dns ? var.instance_count : 0
  zone_id         = var.dns_zone_id
  name            = "${var.hostname}-${format(var.instance_number_prefix, count.index + 1)}"
  type            = "A"
  ttl             = var.dns_zone_ttl
  allow_overwrite = true
  depends_on = [
    aws_instance.ec2_instance
  ]
  records = [
    aws_instance.ec2_instance.*.private_ip[count.index]
  ]
}
