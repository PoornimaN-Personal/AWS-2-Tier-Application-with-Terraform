# AWS-2-Tier-Application-with-Terraform

This project provisions a modular, production-style 2-tier architecture on AWS using Terraform. It includes:

- ✅ VPC with public/private subnets across 2 AZs
- 🌐 Internet Gateway + NAT Gateway
- 🖥️ EC2 instances running httpd webserver
- ⚖️ Application Load Balancer (ALB)
- 🗄️ RDS (MySQL) with secure connectivity
- 🔐 Security groups and route tables
- 📦 Modular Terraform structure

## 📊 Architecture Diagram
![Architecture](architecture.png)

## 🚀 Deployment Instructions

### 1. Clone the Repository

git clone https://github.com/PoornimaN-Personal/AWS-2-Tier-Application-with-Terraform.git

cd terraform-aws-2tier-app

### 2. Initialize Terraform

terraform init

### 3. Review the Plan

terraform plan

### 4. Apply the Infrastructure

terraform apply

## 🔐 Security Design
- ALB allows inbound HTTP traffic from the internet
- EC2 allows traffic only from ALB
- RDS allows traffic only from EC2
- Private subnets route outbound traffic via NAT Gatewa
  
## 🌐 Application Behavior
- EC2 instances run a simple web app via Apache (httpd)
- App connects to RDS using environment variables injected via user_data
- On visiting the ALB DNS, you’ll see a hostname of the server to which it is connected to and also the link to test the connectivity to the RDS database

## 📤 Outputs
After deployment, Terraform will display:
- ✅ ALB DNS name (access your app here)
- ✅ EC2 public IPs (for SSH/debugging)
- ✅ RDS endpoint (used by the app)

## 📌 Screenshots

<img width="831" height="288" alt="image" src="https://github.com/user-attachments/assets/366bb14d-e0b0-4b04-b916-d4342d69b9d2" />

<img width="891" height="411" alt="image" src="https://github.com/user-attachments/assets/47c0ada9-e1f5-4e2b-a594-c44d8f8e2aac" />

<img width="892" height="287" alt="image" src="https://github.com/user-attachments/assets/572206bc-7e36-4764-9abe-ebbcddf8cc23" />

<img width="830" height="343" alt="image" src="https://github.com/user-attachments/assets/7785a726-34a6-4240-86d4-aeae73c00686" />

<img width="877" height="201" alt="image" src="https://github.com/user-attachments/assets/54931ffd-8d0e-4182-8a87-a67555fe271d" />

## 🧹 Cleanup
To destroy all resources:
terraform destroy

## 🧠 Lessons Learned
- Importance of subnet placement and AZ coverage for RDS
- Using templatefile() to inject dynamic values into EC2 user_data
- Modular design improves reusability and clarity
- Security group chaining for tiered access control
