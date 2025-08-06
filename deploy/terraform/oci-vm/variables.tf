variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "availability_domain" {}
variable "image_ocid" {}
variable "shape" {
  default = "VM.Standard.A1.Flex"
}
variable "ocpus" {
  default = 1
}
variable "memory_in_gbs" {
  default = 1
}
variable "vcn_id" {
  description = "OCID of the VCN"
}
variable "ssh_public_key" {
  description = "Public SSH key to access the instance"
  type        = string
}


