provider "aws" {
  region = "ap-south-1"  # Change this to your preferred region
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = "devops-assoc-bucket-amit"

  tags = {
    Name        = "DevOps s3 Bucket"
    Environment = "DevOpsTest"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.devops_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}