# Production_grade_deployment
This repository contains a production-grade AWS EKS infrastructure implementation, created as part of the Terraform 30-Day Challenge (Day 16). The infrastructure follows best practices for modularity, testability, and maintainability.

## Features

- **Modular Design**: Infrastructure broken down into reusable modules
- **Multi-Environment Support**: Separate configurations for development and production
- **Infrastructure as Code Best Practices**: Version-controlled, testable infrastructure
- **Security-First Approach**: IAM roles with least privilege, secure networking

## Architecture Components

### Networking Module
- VPC with public and private subnets
- NAT Gateways for private subnet connectivity
- Configurable Availability Zones
- Security Groups and Route Tables

### IAM Module
- EKS Cluster IAM Role
- Node Group IAM Role
- Optional IRSA (IAM Roles for Service Accounts) support

### EKS Module
- Managed EKS Cluster
- Configurable Node Groups
- Supports both Spot and On-Demand instances
- Customizable scaling configuration

## Project Structure
 ├── environments/ │ ├── dev/ │ │ ├── main.tf # Dev environment configuration │ │ ├── variables.tf # Dev-specific variables │ │ └── terraform.tfvars │ └── prod/ # Production environment setup ├── modules/ │ ├── networking/ # VPC and subnet configurations │ ├── eks/ # EKS cluster and node groups │ └── iam/ # IAM roles and policies └── test/ # Infrastructure tests

 ### How to run this 
 Firstly run the create_file_step.sh file
 This scripts helps create the project structure of where all your terraform will run 
 ```
 ./create_file_step.sh
 ```
 After creating the files and folder where all these will run in step into the environment and dev folder where you will configure your terrafotm code 
 ```
 cd environment
 cd dev
 ```
 Now inside the dev folder initialize your terraform code by running 
 ```
 terraform init
```

Plan the terraform to see if you are satified with your configuration
```
terraform plan
```
If satified run 
```
terraform apply--auto-approve
```