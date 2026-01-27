terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

provider "aws" {
  alias = "us-east"
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami_id = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    instance_type = var.environment == "dev" ? "t3.micrp": "t2.micro" 
    vpc_security_group_ids = [aws_security_group.aws_security_group_name.id]
    provider = aws.us-east
  
}

resource "aws_instance" "example" {
    ami_id = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = var.vpc_id
    provider = aws # default or no need to specify provider here 
    tags = {
      Name = "terraform"
    }
}

resource "aws_security_group" "name" {
    name = "allow ssh"
    description = "allow all"
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
      ipv6_cidr_blocks = [ "::/0" ]
    }
  
}

output "public_ip" {
  value = aws
  
}
