variable "aws_region" {
  description = "AWS Region to deploy service"
  type        = string
  default     = ""
}

########## EC2 Instance Variables ##########
variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance"
  default     = false
}

variable "hostname" {
  type        = string
  default     = ""
  description = "EC2 instance hostname"
}

variable "image_id" {
  type        = string
  description = "The AMI to use for the instance."
  default     = ""
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instance to deploy"
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
  default     = "t2.micro"
}

variable "instance_number_prefix" {
  default = "%02d"
  type    = string
}

variable "instance_profile" {
  type        = string
  description = "A pre-defined profile to attach to the instance"
  default     = ""
}

variable "user_data_base64" {
  type        = list(string)
  description = "Can be used instead of `user_data` to pass base64-encoded binary data directly. Use this instead of `user_data` whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  default     = []
}

variable "user_data" {
  type        = list(string)
  description = "Can be used instead of `user_data` to pass base64-encoded binary data directly. Use this instead of `user_data` whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  default     = []
}

variable "key_name" {
  type        = string
  description = "SSH key pair to be provisioned on the instance"
}

variable "private_ip" {
  type        = string
  description = "Private IP address to associate with the instance in the VPC"
  default     = ""
}

variable "disable_api_termination" {
  default     = true
  type        = bool
  description = "EC2 Instance Termination Protection."
}

variable "root_block_encrypted" {
  default     = true
  type        = bool
  description = "Whether to encrypt the root block device"
}

variable "root_block_kms_key_arn" {
  default     = ""
  type        = string
  description = "KMS key ID used to encrypt Root volume. When specifying kms_key_arn, root_block_encrypted needs to be set to true"

}

variable "root_block_size" {
  type        = number
  description = "Size of the root volume in gigabytes"
  default     = 50
}

variable "root_block_type" {
  type        = string
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "root_block_delete_on_termination" {
  type        = bool
  description = "Whether the volume should be destroyed on instance termination"
  default     = true
}

variable "subnet_tag" {
  default = ""
  type    = string
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Additional security group IDs to apply to the cluster, in addition to the provisioned default security group with ingress traffic from existing CIDR blocks and existing security groups"
  default     = []
}

variable "master_prefix" {
  default     = "dso"
  description = "To specify a key prefix for aws resource"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC that the instance security group belongs to"
}

variable "private_domain" {
  type    = string
  default = "value"
}

########## EBS Volume Attachment Variables ##########
variable "ebs_attach_volume" {
  default     = false
  type        = bool
  description = "EBS volume attachment"
}

variable "ebs_volume_encrypted" {
  default     = true
  type        = bool
  description = "Whether to encrypt the additional EBS volumes"
}

variable "ebs_volume_kms_key_arn" {
  default     = ""
  type        = string
  description = "KMS key ID used to encrypt EBS volume. When specifying kms_key_arn, ebs_volume_encrypted needs to be set to true"
}

variable "ebs_volume_size" {
  default     = 100
  description = "Size of the additional EBS volumes in gigabytes"
  type        = number
}

variable "ebs_volume_type" {
  type        = string
  description = "The type of the additional EBS volumes. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "ebs_volume_device_name" {
  type        = string
  description = "Name of the EBS device to mount"
  default     = "/dev/sdb"
}

variable "ebs_volume_snap_shot_id" {
  default = ""
  type    = string
}

########## Server DNS Variables##########
variable "enable_dns" {
  default     = true
  type        = bool
  description = "A boolean flag to enable/disable add record to route53"
}

variable "dns_zone_id" {
  default     = ""
  type        = string
  description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DB master and replicas"
}

variable "dns_zone_ttl" {
  default = 60
  type    = number
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
