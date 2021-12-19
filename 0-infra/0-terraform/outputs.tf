output "rede" {
  value = [
    "vpc_id: ${aws_vpc.main.id}",
    "subnetPub_a_id: ${aws_subnet.subnetpub_az_a.id}",
    "subnetPub_b_id: ${aws_subnet.subnetpub_az_b.id}",
    "subnetPub_c_id: ${aws_subnet.subnetpub_az_c.id}",
    "subnetPriv_a_id: ${aws_subnet.subnetpriv_az_a.id}",
    "subnetPriv_b_id: ${aws_subnet.subnetpriv_az_b.id}",
    "subnetPriv_c_id: ${aws_subnet.subnetpriv_az_c.id}",
  ]
}