
provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Environment = "DevOpsTest"
    }
  }
}

resource "aws_instance" "devops_instance" {
  ami           = "ami-02521d90e7410d9f0"  # Ubuntu Server 24.04 LTS in ap-south-1
  instance_type = "t2.micro"

  tags = {
    Name = "DevOpsEC2"
    # Environment tag is inherited from provider default_tags
  }
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.devops_instance.public_ip
}
