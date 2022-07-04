data "aws_subnet_ids" "selected" {
  vpc_id = var.vpc_id
  filter {
    name = "tag:Name"
    values = [
      var.subnet_tag,
    ]
  }
}
