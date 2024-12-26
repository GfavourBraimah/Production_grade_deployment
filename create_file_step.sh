#!/bin/bash

# Define directories and files
declare -A structure=(
    ["environments/dev/"]="main.tf variables.tf outputs.tf terraform.tfvars"
    ["environments/prod/"]="main.tf variables.tf outputs.tf terraform.tfvars"
    ["modules/networking/"]="main.tf variables.tf outputs.tf"
    ["modules/eks/"]="main.tf variables.tf outputs.tf"
    ["modules/iam/"]="main.tf variables.tf outputs.tf"
    ["test/"]="eks_test.go"
)

# Create base project files
base_files=(".gitignore" "README.md" "versions.tf")

echo "Creating project structure..."

# Create directories and files
for dir in "${!structure[@]}"; do
    mkdir -p "$dir"
    for file in ${structure[$dir]}; do
        touch "$dir$file"
    done
done

# Create base files
for file in "${base_files[@]}"; do
    touch "$file"
done

echo "Project structure created successfully!"
