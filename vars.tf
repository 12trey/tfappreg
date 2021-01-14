variable "name" {
  type = string
  description = "Application name"
}

variable "iduri" {
  type = string
  description = "This resources app id (TODO: figure out how to use self.id or use output of this to create identifier_uris)"
}

variable "owners" {
  type = list(string)
  description = "Application owners"
}

variable "reply_urls" {
  type = list(string)
  description = "Application allowed reply urls"
}

variable "logout_url" {
  type = string
  description = "Application reply urls"
}