data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_core_vcns" "vcns" {
  compartment_id = var.compartment_ocid
}

data "oci_core_vcn" "default_vcn" {
  vcn_id = data.oci_core_vcns.vcns.virtual_networks[0].id

}

data "oci_core_subnets" "subnets" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcn.default_vcn.id
}

resource "oci_core_instance" "vm" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  display_name        = "java-demo-vm"
  shape               = var.shape

  source_details {
    source_type = "image"
    source_id   = var.image_ocid
  }

  create_vnic_details {
    subnet_id = data.oci_core_subnets.subnets.subnets[0].id
  }

  shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory_in_gbs
  }
  
  metadata = {
  ssh_authorized_keys = file(var.ssh_public_key)

  user_data = base64encode(<<-EOF
                #!/bin/bash

                docker run -d -p 8080:8080 ghcr.io/hashirahmad996/java-demoapp:latest
                EOF
    )
 
  }  


}


