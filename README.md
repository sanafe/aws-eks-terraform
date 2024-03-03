
**NOTE**: Replace placeholders (like `<EKS-LoadBalancer-URL>`) with actual values obtained during deployment.

# Project EKS Deployment with Terraform

This project outlines the deployment of a Kubernetes (EKS) cluster on AWS using Terraform, including the setup for SonarQube, Nexus, and Grafana applications. The deployment is containerized, ensuring scalability and ease of management.

## Prerequisites

Before you start, ensure you have the following prerequisites installed and configured:

- AWS CLI - Configured with at least PowerUser access
- Terraform v0.14 or newer
- kubectl - Configured to interact with your Kubernetes cluster
- aws-iam-authenticator (if required by your kubectl version)

## Configuration Steps

1. **AWS CLI Configuration**: Ensure your AWS CLI is configured with appropriate credentials to deploy resources in your account. Use `aws configure` to set up your access key, secret key, and default region.

2. **Terraform Initialization**:
    - Navigate to the `project-root/terraform` directory.
    - Run `terraform init` to initialize the Terraform environment.

## Deployment

### Common Infrastructure

1. **VPC and EKS Cluster**:
    - From the `project-root/common` directory, run:
      ```
      terraform apply
      ```
    - Confirm the deployment when prompted.

### Application Deployment

After setting up the EKS cluster and configuring `kubectl`, deploy the applications as follows:

1. **SonarQube**:
    - Navigate to `project-root/sonarqube`.
    - Apply the configuration:
      ```
      kubectl apply -f deployment.yaml
      kubectl apply -f service.yaml
      ```

2. **Nexus**:
    - Navigate to `project-root/nexus`.
    - Apply the configuration:
      ```
      kubectl apply -f deployment.yaml
      kubectl apply -f service.yaml
      ```

3. **Grafana**:
    - Navigate to `project-root/grafana`.
    - Apply the configuration:
      ```
      kubectl apply -f deployment.yaml
      kubectl apply -f service.yaml
      ```

## Accessing the Applications

- **SonarQube**: Access SonarQube at `http://<EKS-LoadBalancer-URL>:9000`.
- **Nexus**: Access Nexus at `http://<EKS-LoadBalancer-URL>:8081`.
- **Grafana**: Access Grafana at `http://<EKS-LoadBalancer-URL>:3000`.

> Note: You can find the EKS LoadBalancer URL by running `kubectl get svc`.

## Cleanup

To avoid incurring unnecessary charges, remember to destroy the resources once you are done:

1. **Delete Kubernetes Deployments**:
    - For each application, run `kubectl delete -f service.yaml -f deployment.yaml` in the respective application directory.

2. **Destroy EKS Cluster and VPC**:
    - Navigate back to `project-root/common` and run:
      ```
      terraform destroy
      ```
    - Confirm the destruction when prompted.

## Troubleshooting

- If you encounter issues with the AWS CLI or Terraform, ensure your credentials and configurations are correct.
- For application-specific issues, check the logs using `kubectl logs <pod-name>`.
