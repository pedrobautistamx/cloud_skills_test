# cloud_skills_test


This document provides an overview of the infrastructure created using Terraform in the Google Cloud Platform. Below are the resources that have been created:

1. Google Cloud Storage Bucket for storing data and objects.
2. Two Web Server Instances located in separate subnets.
3. One Database Server Instance in a dedicated subnet.
4. Google Compute Network (VPC) and three Subnets.
5. Firewall Rules (Security Groups) to control traffic to the subnets.
6. Custom Routes to direct traffic to the instances.


## Project Structure

- [cloud_storage.tf](./cloud_storage.tf) : Contains the Terraform configuration to create a Cloud Storage Bucket for storing data and objects. A bucket policy has been applied to allow read access to all users (`allUsers`) in order to read objects from the bucket.
- [cloud_vpc.tf](./cloud_vpc.tf): Create a Virtual Private Cloud (VPC) network that acts as the foundation for the entire infrastructure and enables communication between resources within the network.
- [provider.tf](./provider.tf) : Define Google as a provider and set service account credential for terraform.
- [subnets.tf](./subnets.tf) : Create 3 subnets within the `my-vpc-test` network and are used to isolate resources based on their functionality.
- [security_group.tf](./security_group.tf) : Create a firewall rule that control inbound and outbound traffic for each subnet, allowing only HTTP and HTTPS access.

- [terraform.tfvars](./terraform.tfvars) : A file to store the values of variables used in the Terraform configuration. (Not included in the sample for simplicity)
- [variables.tf](./variables.tf) : Declares the input variables used in the Terraform configuration.
- [README.md](./README.md) : This file, providing an overview and documentation for the project.


## Summary

This Terraform configuration sets up a basic infrastructure in GCP with a storage bucket, VPC, subnets, firewall rules, compute instances for web servers, and a compute instance for the database server. It's essential to review and adjust the configuration based on specific requirements, security needs, and best practices before deploying it to production. Additionally, consider using Terraform variables to manage multiple environments and promote reusability across different deployments.

## Prerequisites

Before running the Terraform code, ensure you have the following prerequisites:

1. [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
2. A GCP account with appropriate credentials and access to create resources.

## Usage

1. Clone this repository to your local machine.
2. Navigate to the project directory:

```bash
cd cloud_skill_test
terraform init
terraform plan
terraform apply
```



## Evaluation Answers

You can find the answer to the technical test at [EVALUATION.md](./EVALUATION.md)

