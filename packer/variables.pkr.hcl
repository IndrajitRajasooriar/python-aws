variable "aws_region" {
  description = "The AWS region to use for building the AMI."
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "The instance type to use for building the AMI."
  type        = string
  default     = "t3.micro"
}