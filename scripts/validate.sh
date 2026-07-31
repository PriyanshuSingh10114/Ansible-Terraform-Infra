#!/bin/bash

set -e

echo "Validating Terraform..."

cd terraform/environments/dev

terraform fmt -recursive
terraform validate

echo "Validation successful."
