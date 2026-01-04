output "vpc-ids" {
    value = aws_vpc.vpc-cre.id
}
output "subnetids" {
    value =var.network_info.subnets[0].subnetid
}
output "routetableids" {
    value = aws_route_table.routetable-cre.id
}
output "internetgatewayids" {
    value = aws_internet_gateway.internetgateway-cre.id
  
}