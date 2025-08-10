#!/usr/bin/env bash
set -euo pipefail

# --- Install jq if not present ---
if ! command -v jq >/dev/null 2>&1; then
  echo "📦 Installing jq..."
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y jq
  else
    echo "❌ Could not install jq (unsupported package manager). Please install jq manually."
    exit 1
  fi
fi

# --- Get Terraform output as JSON ---
echo "📜 Retrieving Terraform outputs..."
terraform output -json -no-color | tee tf_outputs.json

# --- Validate and extract IP ---
if ! jq -e '.vm_public_ip.value' tf_outputs.json >/dev/null; then
  echo "❌ vm_public_ip output not found in Terraform state."
  cat tf_outputs.json
  exit 1
fi

VM_IP=$(jq -r '.vm_public_ip.value' tf_outputs.json)
echo "✅  Public IP: $VM_IP"

# --- If running in GitHub Actions, export to environment ---
if [ -n "${GITHUB_ENV:-}" ]; then
  echo "VM_IP=$VM_IP" >> "$GITHUB_ENV"
fi
