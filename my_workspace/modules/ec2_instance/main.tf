resource "aws_instance" "jenkinsec2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  user_data = var.user_data
}