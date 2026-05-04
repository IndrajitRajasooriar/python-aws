# tfvars for dev environment
############################# General #############################
environment = "dev"
project     = "flask-app"
region      = "eu-west-1"
############################# Network #############################
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = "10.0.1.0/24"
allowed_ingress_cidr = "91.163.239.31/32"
############################# EC2 #############################
ami = "ami-0442403fb8d244144"
instance_type = "t3.micro"

tags = {
  Environment = "dev"
  Project     = "flask-app"
  ManagedBy   = "terraform"
  Owner       = "devops-team"
}