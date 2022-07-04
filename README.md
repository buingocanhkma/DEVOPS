EC2 Instance Module
===================

Required Variables
------------------

- **aws_region**: AWS Region to deploy service
- **instance_count**: Number of instance to deploy
- **image_id**: The AMI to use for the instance.
- **private_domain**: Environment domain
- **hostname**: EC2 instance hostname
- **key_name**: SSH key pair to be provisioned on the instance
- **user_data**: Templates to use for passing data during Terraform deployment
- **instance_profile**: A pre-defined profile to attach to the instance.
- **private_ip**: Optional static private IP
- **vpc_security_group_ids**: Security group IDs to assign to the instance
- **vpc_id**: The ID of the VPC that the instance security group belongs to
- **dns_zone_id**: Route53 parent zone ID
- **subnet_tag**: Tag Name to list of subnet IDs to associate with EC2
- **tags**: A map of tags to add to all resources

Optional Variables
------------------

- **associate_public_ip_address**: Default = false. Set this to true if you need a public IP attached
- **instance_number_prefix**: Default to 2 digits prefix - %02d"
- **instance_type**: Type of EC2 instance to deploy
- **disable_api_termination**: EC2 Instance Termination Protection. Default = true
- **root_block_encrypted**: Whether to encrypt the root block device. Default = true
- **root_block_kms_key_arn**: KMS key ID used to encrypt root block device. When specifying kms_key_arn, root_block_encrypted needs to be set to true
- **root_block_size**: Size of the root volume in gigabytes. Default = 30
- **root_block_type**: Type of root volume. Can be standard, gp2 or io1. Default = GP2
- **root_block_delete_on_termination**: Whether the volume should be destroyed on instance termination. Default = true
- **attach_ebs_volume**: EBS volume attachment. Default = 0
- **ebs_volume_encrypted**: Whether to encrypt the additional EBS volumes. Default = true
- **ebs_volume_kms_key_arn**: KMS key ID used to encrypt EBS volume. When specifying kms_key_arn, ebs_volume_encrypted needs to be set to true
- **ebs_volume_size**: Size of the additional EBS volumes in gigabytes. Default = 100
- **ebs_volume_type**: The type of the additional EBS volumes. Can be standard, gp2 or io1. Default = GP2
- **ebs_volume_device_name**: Name of the EBS device to mount
- **dns_zone_ttl**: Time To Live. Default = 60
- **ebs_volume_snap_shot_id**: 

Outputs
-------

- instance_dns
- instance_id
- instance_subnet_id
- private_ip
- public_ip

Dependencies
------------

None


To Do
-----

License
-------

BSD
MIT

Author Information
------------------

Dustin Nguyen