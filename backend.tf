terraform {
  backend "s3" {
    bucket = "terraform-backend-files-logesh"
    key = "terraform.tfstate"
  }
}