module "dev-infra" {
    source = "./infra-app"
    env = "DEV"
    bucket_name = "infra-app-bucket"
    ec2_ami_id = "ami-0b6d9d3d33ba97d99"
    aws_instance_count = 1
    aws_instance_type = "t2.micro"
    aws_root_storage_size = 20
    volume_type = "gp2"
}

module "prod-infra" {
    source = "./infra-app"
    env = "PROD"
    bucket_name = "infra-app-bucket"
    ec2_ami_id = "ami-0b6d9d3d33ba97d99"
    aws_instance_count = 1
    aws_instance_type = "t2.medium"
    aws_root_storage_size = 20
    volume_type = "gp2"
}

module "uat-infra" {
    source = "./infra-app"
    env = "UAT"
    bucket_name = "infra-app-bucket"
    ec2_ami_id = "ami-0b6d9d3d33ba97d99"
    aws_instance_count = 1
    aws_instance_type = "t2.small"
    aws_root_storage_size = 20
    volume_type = "gp2"
}