.PHONY: all install bootstrap init fmt validate plan apply deploy verify destroy clean help

ENV ?= dev

all: help

## install : Install tooling dependencies (AWS CLI, Terraform, Ansible, Docker, make)
install:
	@echo "==> Running prerequisite tools installation script..."
	./scripts/install.sh

## bootstrap : Initialize remote state S3 bucket using Terraform bootstrap module
bootstrap:
	@echo "==> Bootstrapping Remote State S3 Bucket..."
	cd bootstrap/remote-state && terraform init && terraform apply -auto-approve

## init : Initialize Terraform backend and modules for specified environment (ENV=dev|prod)
init:
	@echo "==> Initializing Terraform for environment: $(ENV)..."
	cd terraform/environments/$(ENV) && terraform init

## fmt : Format all Terraform files recursively
fmt:
	@echo "==> Formatting Terraform code..."
	terraform fmt -recursive

## validate : Run complete system validation (Terraform, Ansible, Shell)
validate:
	@echo "==> Running system validation..."
	./scripts/validate.sh

## plan : Generate and save Terraform execution plan for environment (ENV=dev|prod)
plan:
	@echo "==> Generating Terraform plan for environment: $(ENV)..."
	cd terraform/environments/$(ENV) && terraform init && terraform validate && terraform plan -out=tfplan

## apply : Apply Terraform infrastructure changes for environment (ENV=dev|prod)
apply:
	@echo "==> Applying Terraform infrastructure for environment: $(ENV)..."
	cd terraform/environments/$(ENV) && (if [ -f tfplan ]; then terraform apply tfplan; else terraform apply -auto-approve; fi)

## deploy : Run full end-to-end infrastructure and Ansible deployment (ENV=dev|prod)
deploy:
	@echo "==> Deploying full stack for environment: $(ENV)..."
	./scripts/deploy.sh $(ENV)

## verify : Perform non-destructive runtime health verification (ENV=dev|prod)
verify:
	@echo "==> Running runtime verification checks for environment: $(ENV)..."
	./scripts/verify.sh $(ENV)

## destroy : Destroy Terraform infrastructure for environment (ENV=dev|prod)
destroy:
	@echo "==> Destroying infrastructure for environment: $(ENV)..."
	./scripts/destroy.sh $(ENV)

## clean : Clean temporary cache, lock files, plan files, and logs
clean:
	@echo "==> Cleaning temporary files..."
	./scripts/cleanup.sh

## help : Show this help message
help:
	@echo "Usage: make [target] [ENV=dev|prod]"
	@echo ""
	@echo "Available targets:"
	@echo "  install    Install prerequisite tools (AWS CLI, Terraform, Ansible, Docker)"
	@echo "  bootstrap  Create S3 remote state bucket"
	@echo "  init       Initialize Terraform for target environment"
	@echo "  fmt        Format all Terraform code"
	@echo "  validate   Validate Terraform syntax, Ansible playbooks, and shell scripts"
	@echo "  plan       Run terraform plan and generate tfplan file"
	@echo "  apply      Apply terraform plan for environment"
	@echo "  deploy     Run end-to-end Terraform + Ansible deployment"
	@echo "  verify     Perform non-destructive runtime health verification"
	@echo "  destroy    Destroy target infrastructure"
	@echo "  clean      Clean cache files"
