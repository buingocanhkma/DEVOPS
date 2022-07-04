locals {
  volume_count = var.instance_count > 0 && var.ebs_attach_volume ? var.instance_count : 0
}
resource "aws_ebs_volume" "ebs_volume" {
  count             = local.volume_count
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  availability_zone = aws_instance.ec2_instance.*.availability_zone[count.index]
  snapshot_id       = var.ebs_volume_snap_shot_id
  encrypted         = var.ebs_volume_encrypted
  kms_key_id        = var.ebs_volume_kms_key_arn
  tags = merge(
    var.tags,
    {
      Name     = "${var.master_prefix}-${var.hostname}-${format(var.instance_number_prefix, count.index + 1)}-Volume"
      snapshot = "true"
    }
  )
}

resource "aws_volume_attachment" "ebs_attatchment" {
  count        = local.volume_count
  skip_destroy = false
  force_detach = false
  device_name  = var.ebs_volume_device_name
  volume_id    = aws_ebs_volume.ebs_volume.*.id[count.index]
  instance_id  = aws_instance.ec2_instance.*.id[count.index]
}
