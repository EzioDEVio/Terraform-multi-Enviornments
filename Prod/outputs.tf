
output "prod_vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "prod_subnet_id" {
  value = aws_subnet.dev_subnet.id
}

output "prod_instance_public_ip" {
  value = aws_instance.dev_instance.public_ip
}

output "prod_key_pair_name" {
  value = aws_key_pair.dev_key.key_name
}
