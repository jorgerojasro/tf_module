terraform {
  #required_version = "1.3.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.62.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">=4.62.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.20.0"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = ">=2.2.6"
    }
  }
}
