variable "name" {
  description = "リソースの識別子として使用される名前"
  type        = string
}

variable "webapp_image" {
  description = "docker image"
  type        = string
}
