output "public-ip-address" {
  value = aws_instance.jenkinsec2.public_ip
}