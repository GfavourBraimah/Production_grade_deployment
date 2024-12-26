provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "dev"
      Project     = var.project_name
      ManagedBy   = "terraform"
    }
  }
}

locals {
  cluster_name = "${var.project_name}-${var.environment}"
}

module "networking" {
  source = "../../modules/networking"

  environment   = var.environment
  vpc_cidr      = var.vpc_cidr
  az_count      = var.az_count
  cluster_name  = local.cluster_name
  tags          = var.tags
}

module "iam" {
  source = "../../modules/iam"

  cluster_name = local.cluster_name
  enable_irsa  = var.enable_irsa
  tags         = var.tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name            = local.cluster_name
  cluster_role_arn       = module.iam.cluster_role_arn
  node_role_arn          = module.iam.node_role_arn
  private_subnet_ids     = module.networking.private_subnet_ids
  public_subnet_ids      = module.networking.public_subnet_ids
  vpc_id                 = module.networking.vpc_id
  kubernetes_version     = var.kubernetes_version
  node_instance_types    = var.node_instance_types
  node_group_min_size    = var.node_group_min_size
  node_group_max_size    = var.node_group_max_size
  node_group_desired_size = var.node_group_desired_size
  capacity_type         = var.capacity_type
  tags                  = var.tags
}