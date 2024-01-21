# Techcasts Infra - Google Cloud Terraform

## Overview

Welcome to the Techcasts Infra repository! This repository contains the Infrastructure as Code (IaC) in Terraform language to set up the infrastructure for the Techcasts podcast streaming platform on Google Cloud. This README will guide you through the necessary steps to deploy and manage the infrastructure using Terraform.

## Prerequisites

Before you begin, make sure you have the following prerequisites installed and configured:

- **Terraform**: Ensure that Terraform is installed on your local machine. You can download it from the [official website](https://www.terraform.io/).

- **Google Cloud Platform (GCP) Account**: You need a GCP account and a project set up. Obtain the project ID and authentication credentials (service account key file).

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/techcasts-infra.git
   cd techcasts-infra
   ```

2. **Configure Terraform:**
   Create a `terraform.tfvars` file and provide the necessary variables. You can use the `terraform.tfvars.example` file as a template.

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Review Configuration:**
   Review the Terraform configurations in the main.tf and other relevant files to ensure they match your requirements.

5. **Deploy Infrastructure:**
   ```bash
   terraform apply
   ```
   Confirm the deployment by typing `yes` when prompted.

## Terraform Modules

This repository is organized into modular components for better maintainability and reusability. Each module represents a specific part of the infrastructure, such as networking, storage, or compute resources.

- **Module 1: `network`**
  - Description: Sets up the VPC, subnets, and firewall rules for the Techcasts platform.

- **Module 2: `storage`**
  - Description: Creates storage buckets for media files and other assets.

- **Module 3: `compute`**
  - Description: Configures virtual machines, load balancers, and other compute resources.

## Updating and Destroying Infrastructure

To update your infrastructure or destroy it when it's no longer needed:

- **Update Infrastructure:**
  ```bash
  terraform apply
  ```

- **Destroy Infrastructure:**
  ```bash
  terraform destroy
  ```
  Confirm the destruction by typing `yes` when prompted.

## Contributing

We welcome contributions to improve and enhance the Techcasts Infra repository. Please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

Special thanks to the contributors and the open-source community for their support and collaboration.

Happy podcast streaming with Techcasts! 🎙️🚀