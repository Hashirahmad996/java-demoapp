#!/usr/bin/env bash
set -e

echo "📜 Retrieving VM public IP..."

# Run terraform, suppress wrapper logs, keep only first IPv4 address
VM_IP=$(terraform output -raw vm_public_ip 2>&1 | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -n 1)

if [ -z "$VM_IP" ]; then
  echo "❌ vm_public_ip output not found in Terraform state."
  exit 1
fi

echo "✅ VM Public IP: $VM_IP"

# Output to GitHub Actions outputs
echo "vm_ip=$VM_IP" >> "$GITHUB_OUTPUT"
