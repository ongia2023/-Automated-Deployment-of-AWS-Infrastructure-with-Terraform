# Terraform Infrastructure Deployment Documentation

## Overview

This documentation provides an overview of the Terraform infrastructure 
deployment project.The project includes the creation of
 AWS resources, such as a Virtual Private Cloud (VPC) and EC2 instances.

## Project Structure

The project is organized into the following structure:

- **TERRAFORM/**
  - **main.tf**: Contains the main Terraform configuration.
  - **variables.tf**: Defines input variables.
  - **outputs.tf**: Specifies the outputs to display after
   Terraform applies the configuration.
  - **scripts/**
    - **create_ansible_docker.sh**: Bash script for setting up Ansible and Docker on EC2 instances.
  - **modules/**
    - **vpc/**
      - **main.tf**: VPC-specific configuration.
      - **variables.tf**: VPC-specific variables.
      - **outputs.tf**: VPC-specific outputs.
    - **ec2_instance/**
      - **main.tf**: EC2 instance-specific configuration.
      - **variables.tf**: EC2 instance-specific variables.
      - **outputs.tf**: EC2 instance-specific outputs.

## Input Variables

The following input variables are defined in `variables.tf`:

- **regions**: List of AWS regions.
- **availability_zones**: AWS availability zones for each region.
- **environments**: List of environments (e.g., "dev", "prod").
- **instance_type**: AWS instance type.
- **ami**: Map of AMI IDs for Ubuntu in different regions.
- **vpc_cidr**: CIDR block for VPC.
- **default_region**: Default AWS region.

## Outputs

The following outputs are defined in `outputs.tf`:

- **vpc_id**: ID of the created VPC.
- **subnet_ids**: List of created subnet IDs in the selected region and availability zones.
- **ec2_instance_public_ips**: List of public IP addresses for the created EC2 instances.
- **ansible_docker_script**: Script to create Ansible and Docker containers on the EC2 instances.

## Usage

1. Run `terraform init` to initialize the Terraform configuration.
2. Modify input variables in `variables.tf` if needed.
3. Run `terraform plan` to review the changes.
4. Run `terraform apply` to apply the Terraform configuration and create AWS resources.

## Additional Notes

- Ensure that AWS credentials are properly configured.
- Review the Terraform configuration files for any customization needed.

## Troubleshooting

If you encounter any issues during deployment, refer to the error messages provided by Terraform. Common issues may include AWS credentials, resource naming conflicts, or regional availability.

For detailed logs, run `terraform apply -debug` and inspect the output.

## Author

Ongia Emmanuel
