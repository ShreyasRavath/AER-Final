# 🛠️ Disaster Recovery Automation Components
This directory contains automation files used for DR setup and GitOps...

## 🔹 ArgoCD Blue-Green Apps
- `app-blue.yaml`: ArgoCD Application targeting the `blue` namespace
- `app-green.yaml`: ArgoCD Application targeting the `green` namespace
- `argocd-ingress.yaml`: Ingress resource to expose ArgoCD UI via ALB

## 🔸 GitHub Workflows
Includes ArgoCD install, app deployment, DR workflows

## 🔸 Slack Integration
See `SLACK_INTEGRATION.md` to enable Slack alerts