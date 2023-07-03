variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "Name for the S3 bucket to store terraform state file"
  default     = "tiago-tfstates"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t3.micro"
}

variable "domain_name" {
  description = "Domain name for Route53"
  default     = "oldtechgeek.org"
}

variable "route53_zone_id" {
  description = "Route53 Zone ID"
}
