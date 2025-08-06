provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "vm" {
  source            = "./modules/compute_instance"
  compartment_ocid  "GkgN:ME-DUBAI-1-AD-1"
  availability_domain = var.availability_domain
  image_ocid        = var.image_ocid
  shape             = "VM.Standard.E2.1.Micro"
  ocpus             = 1
  memory_in_gbs     = 1
  vcn_id            = var.vcn_id
  
 ssh_public_key    = var.ssh_public_key
}
