variable "repo_name" {
  description = "The application repository name."
  type        = string
  default = "fs_repo"
}
 
 
variable "app_environment" {
  description = "The application environment that image represents."
  type        = string
  #default = "fs_dev"
}
 
variable "image_description" {
  description = "A meaningful description for the image."
  type        = string
  #default = "fs_wp"
}
 
variable "image_scan" {
  description = "Defines if the image should be scanned for vulnerabilities on push."
  type        = bool
  #default = true
}
 
variable "image_age" {
  description = "Delete images older than number of days."
  type        = number
  #default = 15
}