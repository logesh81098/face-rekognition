terraform {
  backend "s3" {
    bucket = "terraform-backend-files-logesh"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}