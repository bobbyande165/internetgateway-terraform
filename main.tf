resource "aws_vpc" "vpc-cre" {
    cidr_block = var.network_info.vpcid
    tags={
        Name=var.network_info.vpcname
    }  
}
resource "aws_subnet" "subnet-cre" {
    vpc_id = aws_vpc.vpc-cre.id
    count = local.value
    cidr_block =var.network_info.subnets[0].subnetid[count.index]
    availability_zone =  var.network_info.subnets[0].subnetaz[count.index]
    tags = {
      Name=var.network_info.subnets[0].subnetname[count.index]
    }
    depends_on=[aws_vpc.vpc-cre]
}
resource "aws_route_table" "routetable-cre" {
    vpc_id =aws_vpc.vpc-cre.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internetgateway-cre.id
    } 
    tags = {
      Name=var.network_info.routetablename
    }
    depends_on = [ aws_vpc.vpc-cre ]
}
resource "aws_internet_gateway" "internetgateway-cre" {
    vpc_id =aws_vpc.vpc-cre.id
    tags={
        Name=var.network_info.internetgatewayname
    }
    depends_on = [ aws_vpc.vpc-cre ]
}
resource "aws_route_table_association" "name" {
    count = local.value
    subnet_id =aws_subnet.subnet-cre[count.index].id
    route_table_id =  aws_route_table.routetable-cre.id
    depends_on = [ aws_subnet.subnet-cre,aws_route_table.routetable-cre ]
}