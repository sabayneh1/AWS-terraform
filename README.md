# Terraform AWS Infrastructure

This Terraform project deploys a simple AWS infrastructure, including a Virtual Private Cloud (VPC) and Linux instances.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)

Make sure to configure your AWS credentials using `aws configure`.

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/sabayneh1/AWS-terraform.git
cd <repository_directory>

2. Initialize Terraform

3. Adjust Variables
Review and adjust the variables in terraform.tfvars and modules/linux/variables.tf as needed.

4. Deploy Infrastructure

terraform apply

5. Clean Up
To destroy the infrastructure when done:

terraform destroy
Save to grepper
Project Structure
The project is organized into the following directories:

main.tf: Defines the main infrastructure using the VPC and Linux instance modules.
terraform.tfvars: Variables file with configuration values.
modules/vpc: Module for creating the AWS VPC.
main.tf: VPC resource definitions.
variables.tf: Input variables for the VPC module.
outputs.tf: Output values from the VPC module.
modules/linux: Module for creating Linux instances.
main.tf: Linux instance resource definitions.
variables.tf: Input variables for the Linux module.
outputs.tf: Output values from the Linux module.
Outputs
vpc_id: ID of the VPC.
public_subnet_ids: IDs of the public subnets.
private_subnet_ids: IDs of the private subnets.
ec2_public_ips: Public IP addresses of the EC2 instances.
ec2_public_dns: Public DNS names of the EC2 instances.
ec2_private_ips: Private IP addresses of the EC2 instances
