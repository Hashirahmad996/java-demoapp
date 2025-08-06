provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "vm" {
  source            = "./modules/compute_instance"
  compartment_ocid  = var.compartment_ocid
  availability_domain = var.availability_domain
  image_ocid        = var.image_ocid
  shape             = var.shape
  ocpus             = var.ocpus
  memory_in_gbs     = var.memory_in_gbs
  vcn_id            = var.vcn_id
  
 ssh_public_key    = var.ssh_public_key
}
