URL Shortener App – Production-Ready Cloud Deployment on AWS

This project deploys a URL Shortener as a fully managed, production-grade web application on AWS. Instead of running locally, the app is hosted on scalable, secure cloud infrastructure that includes:

Scalable hosting: Deployed on AWS ECS Fargate, which automatically manages containers and scales based on demand
Zero-downtime releases: Blue/Green deployments via CodeDeploy with automated health checks and traffic shifting
Secure access: HTTPS-ready architecture using ALB, private networking, and IAM least-privilege roles
Automated CI/CD: GitHub Actions pipeline that builds the Docker image, pushes to ECR, and deploys to ECS using OIDC (no AWS keys needed)
Production infrastructure: Load balancing, isolated VPC networking, role-based access, and logging built in

The application runs reliably in the cloud, supports continuous deployments, and is built with Terraform for fully reproducible infrastructure.