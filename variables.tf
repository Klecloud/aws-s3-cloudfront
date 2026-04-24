variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name used to tag and identify all resources"
  type        = string
  default     = "klecloud-portfolio"
}
