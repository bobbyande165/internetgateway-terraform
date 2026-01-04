variable "network_info" {
    type=object({
      vpcid = string
      vpcname=string
      routetablename=string
      internetgatewayname=string
      subnets=list(object({
        subnetname=list(string)
        subnetid=list(string)
        subnetaz=list(string) 
      }))
    })
    default = {
      vpcname = "vpc22"
      vpcid = "10.0.0.0/16"
      routetablename = "rtb22"
      internetgatewayname = "intergway22"
      subnets = [ {
        subnetname=["sub1","sub2"]
        subnetid=["10.0.1.0/24","10.0.2.0/24"]
        subnetaz=["ap-south-1a","ap-south-1b"]
      } ]
    }
}