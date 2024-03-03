variable "region" {
  description = "AWS region to deploy resources."
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the VPC subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
