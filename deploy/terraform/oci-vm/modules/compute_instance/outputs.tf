# Get the first (primary) VNIC
data "oci_core_vnic_attachments" "vm_vnics" {
  compartment_id      = var.compartment_ocid
  instance_id         = oci_core_instance.vm.id
}

data "oci_core_vnic" "primary_vnic" {
  vnic_id = data.oci_core_vnic_attachments.vm_vnics.vnic_attachments[0].vnic_id
}

output "vm_public_ip" {
  value = data.oci_core_vnic.primary_vnic.public_ip_address
}
