variable "compartment_ocid" {}
variable "availability_domain" {}
variable "image_ocid" {}
variable "shape" {}
variable "ocpus" {}
variable "memory_in_gbs" {}
variable "region" {
  default = "me-dubai-1"
}
variable "vcn_id" {
  description = "OCID of the VCN"

}
variable "ssh_public_key" {
  description = "Public SSH key to access the instance"
  type        = string
}

