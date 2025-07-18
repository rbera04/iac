<!-- \x1b[[0-9;]*m  -->
# 🏗️ Terraform Infrastructure for Multi-Customer, Multi-Environment Deployments

This repository implements a scalable and modular Terraform architecture with shared tagging, reusable modules, and environment separation. It is designed to support multiple customers and environments with consistent naming and security best practices.

---

## 📂 Folder Structure Overview

```bash
terraform/
├── shared/            # Shared tagging, variables, locals, provider config
│   ├── variables.tf
│   ├── locals.tf
│   ├── tags.tf
│   └── backend.tf     # (optional) Remote state backend config
│
├── envs/              # Environment-specific tfvars
│   ├── dev/
│   │   └── terraform.tfvars
│   └── prod/
│       └── terraform.tfvars
│
├── modules/           # Reusable Terraform modules
│   ├── s3/
│   ├── vpc/
│   ├── eks/
│   ├── iam/
│   └── ...
│
├── vpc/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
└── ...

