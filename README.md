# URL Shortener – Production-Ready Deployment on AWS ECS

## What This Project Does

This project deploys a URL Shortener as a production-ready, cloud-hosted application on AWS ECS Fargate. Instead of running the app locally or manually managing servers, this setup provides:

- Scalable hosting: Runs on AWS ECS Fargate with automatic scaling
- High availability: Deployed across multiple Availability Zones
- Secure access: HTTPS termination through an Application Load Balancer (ALB)
- Automated deployments: GitHub Actions pipeline with CodeDeploy Blue/Green
- Zero-downtime deployments: Traffic shifting, health checks, and rollback
- Infrastructure as Code: Entire AWS environment built with Terraform using native state management

---

## Architecture Diagram

This diagram represents the AWS infrastructure supporting the deployment.

![Architecture Diagram](images/Screenshot%202025-12-01%20at%2016.11.05.png)

---

## Deployment Status (GitHub Actions)

A successful CI/CD pipeline run showing the automated build and deployment workflow:

![GitHub Actions Workflow](images/Screenshot%202025-12-01%20at%2016.11.48.png)

---

## Blue/Green Deployment Status (CodeDeploy)

AWS CodeDeploy manages blue/green deployments with controlled traffic shifting:

![CodeDeploy Deployment Status](images/Screenshot%202025-12-01%20at%2016.21.46.png)

---

## Project Structure

url-shortener/  
├── .github/  
│   └── workflows/  
│       ├── apply.yml  
│       ├── build.yml  
│       └── destroy.yml  
├── app/  
│   ├── src/  
│   ├── tests/  
│   ├── .dockerignore  
│   ├── Dockerfile  
│   └── requirements.txt  
├── images/  
├── infra/  
│   ├── env/  
│   ├── dev/  
│   ├── prod/  
│   ├── modules/  
│   │   ├── acm/  
│   │   ├── alb/  
│   │   ├── codedeploy/  
│   │   ├── dynamodb/  
│   │   ├── ecr/  
│   │   ├── ecs/  
│   │   ├── iam/  
│   │   ├── route53/  
│   │   ├── sgs/  
│   │   ├── vpc/  
│   │   ├── vpcend/  
│   │   └── waf/  
│   └── state/  
├── OIDC/  
├── .gitignore  
└── README.md  

---

## Security

This deployment follows modern AWS security best practices:

- Terraform uses native S3 state management and state locking
- ECS tasks run in isolated private subnets
- Security groups follow least-privilege access
- HTTPS enforced using ACM certificates integrated with ALB
- GitHub Actions authentication uses OIDC instead of long-lived IAM credentials
- No static AWS access keys are stored locally or in GitHub
