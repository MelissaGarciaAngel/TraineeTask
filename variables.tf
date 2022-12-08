#Defining AWS Region
variable "region" {
  description = "Infrastructure region"
  type        = string
  default     = "us-east-1"
}

#Defining IAM User Access Key
variable "access_key" {
  description = "The access_key that belongs to the IAM user"
  type        = string
  sensitive   = true
  # Please insert your access Key in the following line
  default     = "your_access_key"
}

#Defining IAM User Secret Key
variable "secret_key" {
  description = "The secret_key that belongs to the IAM user"
  type        = string
  sensitive   = true
    # Please insert your secret Key in the following line
  default     = "your_secret_key"
}