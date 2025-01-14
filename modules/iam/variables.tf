variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "enable_irsa" {
  description = "Enable IAM roles for service accounts"
  type        = bool
  default     = true
}
