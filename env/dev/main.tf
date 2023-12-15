module "aws-dev" {
  source = "../../infra"
  instance_type = "t2.micro"
  region = "us-east-1"
  ssh_key = "ec2-key"
}

output "IP" {
  value = module.aws-dev.public_ip_out
}