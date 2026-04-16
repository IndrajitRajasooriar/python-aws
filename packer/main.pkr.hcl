packer {
  required_plugins {
    amazon-ebs = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "rhel" {
  ami_name      = "rhel-{{timestamp}}"
  instance_type = var.instance_type
  region        = var.aws_region
  source_ami_filter {
    filters = {
      name                = "RHEL-8*"
      virtualization-type = "hvm"
      architecture        = "x86_64"
    }
    most_recent = true
    owners      = ["309956199498"] # Red Hat's AWS account ID
  }
  ssh_username    = "ec2-user"
  ami_description = "An AMI RHEL-8 built with Packer"

}
build {
  sources = ["source.amazon-ebs.rhel"]

  provisioner "shell" {
    script = "../script.sh"
  }
}
