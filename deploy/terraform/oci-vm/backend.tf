terraform {
  backend "oci" {
    bucket        = "terraform-state"        # your bucket name
    namespace     = "axdksa5hyjbq"    # your OCI namespace
    region        = "me-dubai-1"              # your OCI region
    key           = "oci_vm/terraform.tfstate" # file path inside bucket
  }
}
