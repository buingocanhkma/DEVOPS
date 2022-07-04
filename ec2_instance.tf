resource "aws_instance" "ec2_instance" {
  count                       = var.instance_count
  ami                         = var.image_id
  iam_instance_profile        = var.instance_profile
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = tolist(data.aws_subnet_ids.selected.ids)[count.index]
  user_data                   = var.user_data[count.index]
  vpc_security_group_ids      = compact(flatten([var.vpc_security_group_ids]))
  disable_api_termination     = var.disable_api_termination
  # user_data_base64            = var.user_data_base64[count.index]

  lifecycle {
    ignore_changes = ["instance_type", "key_name", "id", "root_block_device", "user_data_base64"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.master_prefix}-${var.hostname}-${format(var.instance_number_prefix, count.index + 1)}"
    }
  )

  root_block_device {
    volume_size           = var.root_block_size
    volume_type           = var.root_block_type
    delete_on_termination = var.root_block_delete_on_termination
    encrypted             = var.root_block_encrypted
    kms_key_id            = var.root_block_kms_key_arn
    tags = merge(
      var.tags,
      {
        Name = "${var.master_prefix}-${var.hostname}-${format(var.instance_number_prefix, count.index + 1)}"
      }
    )
  }
}

