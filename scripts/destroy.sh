#!/bin/bash

set -e

echo "Destroying infrastructure..."

cd terraform/environments/dev

terraform destroy

echo "Infrastructure destroyed."
