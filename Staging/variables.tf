
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
}

variable "staging_vpc_cidr" {
  description = "The CIDR block for the dev VPC"
  default     = "10.0.0.0/16"
}

variable "staging_subnet_cidr" {
  description = "The CIDR block for the dev subnet"
  default     = "10.0.1.0/24"
}

variable "staging_public_key_path" {
  description = "The path to the public key to be used for the dev EC2 instance"
}
