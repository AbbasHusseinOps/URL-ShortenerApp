URL Shortener – Production-Ready Cloud Deployment on AWS
What does this project deliver?

A fully automated, scalable, and secure cloud deployment of a URL Shortener application using modern AWS infrastructure and CI/CD practices.

This setup provides:

Scalable hosting – Hosted on AWS ECS Fargate with automatic container orchestration and scaling

Zero-downtime deployments – Blue/Green releases via CodeDeploy with health checks and traffic shifting

Secure architecture – HTTPS-ready load balancing, private networking, and IAM least-privilege roles

Automated CI/CD – GitHub Actions pipeline that builds, pushes, and deploys using OIDC (no stored AWS keys)

Production-grade infrastructure – Terraform-managed resources, ALB load balancing, logging, and networking best practices