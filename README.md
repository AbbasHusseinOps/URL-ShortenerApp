URL Shortener – Production-Ready Deployment on AWS ECS
What This Project Does

This project deploys a URL Shortener as a production-ready, cloud-hosted application on AWS ECS Fargate. Instead of running the app locally or manually managing servers, this setup provides:

Scalable hosting: Runs on AWS ECS Fargate with automatic scaling

High availability: Deployed across multiple Availability Zones

Secure access: HTTPS termination through an Application Load Balancer (ALB)

Automated deployments: GitHub Actions pipeline with CodeDeploy Blue/Green

Zero-downtime deployments: Traffic shifting, health checks, and rollback

Infrastructure as Code: Entire AWS environment built with Terraform using native state management

Architecture Diagram

This diagram represents the AWS infrastructure supporting the deployment.

Deployment Status (GitHub Actions)

A successful CI/CD pipeline run showing the automated build and deployment workflow:

Blue/Green Deployment Status (CodeDeploy)

AWS CodeDeploy manages blue/green deployments with controlled traffic shifting:

Project Structure
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

Security

This deployment follows modern AWS security best practices:

Terraform uses native state management and locking

ECS tasks run in private subnets

Security groups follow least privilege

HTTPS enforced using ACM certificates and ALB

GitHub Actions uses OIDC to assume AWS roles (no stored credentials)

No long-lived AWS access keys used anywhere