#Defining AWS Region
variable "region" {
  description = "Infrastructure region"
  type        = string
  default     = "us-east-1"
}

#Defining IAM User profile
variable "profile" {
  # Please create the profile using AWS CLI
  default     = "trainee_challenge"
}