# **AWS Infrastructure Automation with Terraform**

## **Project Overview**

This Terraform project automates the deployment of a scalable and secure cloud infrastructure on AWS. It includes the creation of a VPC, Linux and Windows instances, IAM roles and policies for enhanced security, and well-defined security groups for network protection.

## **Features**

- **VPC Creation**: Configures a Virtual Private Cloud (VPC) with public subnets across multiple availability zones for high availability.
- **Linux and Windows Instances**: Automates the deployment of both Linux and Windows instances within the created VPC.
- **IAM Roles and Policies**: Sets up IAM roles and policies for EC2 instances to securely access AWS services.
- **Security Groups**: Defines security groups to manage inbound and outbound traffic for instances, ensuring a secure networking environment.

## **Prerequisites**

- AWS CLI installed and configured
- Terraform v0.12+ installed

## **Setup Instructions**

### **Step 1: Clone the Repository**

Clone this repository to your local machine to get started with the Terraform configurations.

```
git clone https://github.com/sabayneh1/AWS-terraform.git

```

### **Step 2: Initialize Terraform**

Navigate to the project directory and initialize Terraform to download necessary providers and modules.

```
cd <project-directory>
terraform init

```

### **Step 3: Create a Terraform Plan**

Generate a Terraform execution plan to preview the changes that Terraform will make to your AWS infrastructure.

```
terraform plan
```

### **Step 4: Apply the Terraform Configuration**

Apply the Terraform configuration to create the resources on AWS as defined in the project.

```
terraform apply
```

Confirm the action by typing **`yes`** when prompted.

### **Step 5: Access the Instances**

Once the deployment is complete, you can access the Linux and Windows instances using their public IP addresses. For Windows instances, RDP into the instance using the provided administrator credentials. For Linux instances, SSH into the instance using the key pair specified during the setup.

## **IAM Roles and Policies**

The project configures IAM roles and policies to grant the EC2 instances minimal access necessary to perform their functions. These roles are associated with the instances during the deployment.

## **Security Groups**

Security groups are defined to allow traffic on specific ports:

- **Linux Instances**: SSH (Port 22), HTTP (Port 80), HTTPS (Port 443)
- **Windows Instances**: RDP (Port 3389), HTTP (Port 80), HTTPS (Port 443)

Adjust the security group rules as per your project requirements for tighter security.

## **Cleanup**

To destroy the resources created by Terraform and prevent further charges, run the following command:

```
terraform destroy
```

## **Contributing**

Contributions to improve the configurations or add new features are welcome. Please follow the standard pull request process.
