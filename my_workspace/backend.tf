terraform {
  backend "s3" {
    bucket = "jenkins-terraform-remote-bkd2023"
    key = "deballo/terraform.tfstate"
    region = "us-east-1"
  }
}