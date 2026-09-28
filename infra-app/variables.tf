variable "env" {
  type = string
  description = "The environment for the infrastructure (e.g., Dev, Staging, Prod)."
}

variable "bucket_name" {
  type = string
  description = "The name of the S3 bucket."
}

variable "ec2_ami_id" {
  type = string
  description = "The AMI ID for the EC2 instance."
}

variable "aws_instance_count" {
  type = number
  description = "The number of EC2 instances to create."
}

variable "aws_instance_type" {
  type = string
  description = "The instance type for the EC2 instance."
}

variable "aws_root_storage_size" {
  type = number
  description = "The size of the root storage for the EC2 instance in GB."
}

variable "volume_type" {
  type = string
  description = "The type of volume for the EC2 instance."
}