# tf-module

- Instalar pre-commit
    - pip install pre-commit
    - brew install pre-commit

- Verificar versión
    - pre-commit --version

- Instalar los hooks en el repositorio git local
    - pre-commit install

- Correr los hooks sin ejecutar el commit (opcional)
    - pre-commit run --all-files


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | >=2.2.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=4.62.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >=4.62.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_argocd"></a> [argocd](#provider\_argocd) | >=2.2.6 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >=2.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [argocd_cluster.gke](https://registry.terraform.io/providers/oboukili/argocd/latest/docs/resources/cluster) | resource |
| [kubernetes_cluster_role.argocd_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.argocd_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_secret.argocd_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service_account.argocd_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_client_ca_cert"></a> [cluster\_client\_ca\_cert](#input\_cluster\_client\_ca\_cert) | GKE CA Cert | `string` | n/a | yes |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | GKE endpoint | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | GKE Cluster Name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
