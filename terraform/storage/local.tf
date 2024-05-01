locals {
  www_domain       = "www.${var.domain}"
  https_www_domain = "https://${local.www_domain}"
  https_domain     = "https://${var.domain}"
  names            = [var.domain, local.www_domain]

}