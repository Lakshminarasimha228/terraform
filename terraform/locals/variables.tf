variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "component" {
    default = "cart"
}

variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}
    
/* variable "final-name" {
    default = ${var.project}-${var.environment}-${var.component}"
} */

 # ec2 name = cart
 # ec2 name =  roboshop-dev-cart