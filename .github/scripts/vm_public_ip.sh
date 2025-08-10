#!/usr/bin/env bash
set -e

echo "📜 Retrieving VM public IP..."
VM_IP=$(terraform output -raw vm_public_ip || head -n 1)

if [ -z "$VM_IP" ]; then
  echo "❌ vm_public_ip output not found in Terraform state."
  exit 1
fi

echo "✅ VM Public IP: $VM_IP"

# Optionally export for other steps
echo "VM_IP=$VM_IP" >> "$GITHUB_ENV"
