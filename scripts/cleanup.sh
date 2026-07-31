#!/bin/bash

echo "Cleaning temporary files..."

find . -name ".terraform" -type d -exec rm -rf {} +
find . -name "*.tfstate*" -delete
find . -name "*.retry" -delete

echo "Cleanup completed."
