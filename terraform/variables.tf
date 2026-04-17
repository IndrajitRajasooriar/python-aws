variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  //default     = "ami-0956e0658ee3b1ffb"
  default = "ami-0442403fb8d244144"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t3.micro"
}