variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "ap-southeast-1"
}

varaible "COREOS_AMI" {
  default = "ami-028e043d0e518a84a"
}

variable "UBUNTU_AMI" {
  type = "map"

  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

variable "VERSION" {
  default = "1.0.0"
}

variable "MINIMUM_INSTANCE_SIZE" {
  default = 1
}

variable "DESIRED_INSTANCE_SIZE" {
  default = 1
}

variable "MAXIMUM_INSTANCE_SIZE" {
  default = 2
}
