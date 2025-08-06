.PHONY: init plan apply destroy

init:
		terraform init

plan:
		terraform plan -var-file=terraform.tfvars

apply:
		terraform apply -auto-approve -var-file=terraform.tfvars

destroy:
		terraform destroy -auto-approve -var-file=terraform.tfvars

