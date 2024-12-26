variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "ARN of the cluster IAM role"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the node IAM role"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version to use"
  type        = string
  default     = "1.27"
}

variable "node_group_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "node_group_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_instance_types" {
  description = "List of instance types for the worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}