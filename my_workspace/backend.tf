terraform {
  backend "s3" {
    bucket = "your-bucket-name"
    key = "path_of_your_tfstate"
    region = "your-region"
  }
}