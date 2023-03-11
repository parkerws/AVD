variable "asg_name" {
  description = "Desired name of Application Security group"
  type = string
}

variable "location" {
  description = "Location to deploy resources"
  type = string
}

variable "nic_list" {
  description = "List of NIC ids to associate to the App Security Group"
  type = list
}

variable "rg_name" {
  description = "Name of resource group to deploy ASG in"
  type = string
}