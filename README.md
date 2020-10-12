[![Lint Status](https://github.com/aidanmelen/terraform-shell-whalebrew/workflows/Lint/badge.svg)](https://github.com/aidanmelen/terraform-shell-whalebrew/actions)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![cookiecutter-tfe-workspace](https://img.shields.io/badge/cookiecutter--tfe--workspace-enabled-brightgreen)](https://github.com/ps-data/cookiecutter-tfe-workspace)
[![tflint](https://img.shields.io/badge/code--style-tflint-black)](https://github.com/terraform-linters/tflint)


# terraform-shell-whalebrew

Manage [Whalebrew](https://github.com/whalebrew/whalebrew) packages with Terraform.

> Whalebrew creates aliases for Docker images so you can run them as if they were native commands. It's like Homebrew, but with Docker images.

## Assumptions

This project assumes that you have Docker, Whalebrew, and Terraform installed.

## Usage

Use the [terraform.tfvars](https://github.com/aidanmelen/terraform-shell-whalebrew/terraform.tfvars) file to define a list of Whalebrew packages to install. Add a package to the list and it will be installed. Remove a package from the list and it will be uninstalled.

```
whalebrew_images = [
  "whalebrew/whalesay",         # stable whalebrew optimized docker image.
  "hashicorp/terraform:0.13.0"  # non optimized docker image, but still works.
  "aidanmelen/terraform-docs",  # some docker images that I wrapped with whalebrew docker lables.
  "aidanmelen/tflint",
  "aidanmelen/tfsec",
  "aidanmelen/pre-commit",
  "aidanmelen/cookiecutter",
]
```

[Here](https://github.com/whalebrew/whalebrew-packages/) is a complete list of stable Whalebrew packages. Note that most Dockerized command line tools will work with Whalebrew.

Then run the Terraform core workflow.

```bash
terraform init
terraform plan
terraform apply
```

## Known Issues

Whalebrew (`<= 0.2.3`) requires a confirm prompt to uninstall packages. This manual procedure is great for protecting against the accidental uninstallment of packages, but it breaks the uninstall automation for the Shell provider. The work around solution can be found here in this [pull request](https://github.com/whalebrew/whalebrew/pull/107).

## Makefile Targets

```text
Available targets:

  install                             Initialize and install pre-commit
  lint                                Lint terraform code
```

## License

MIT Licensed. See [LICENSE](https://github.com/aidanmelen/terraform-shell-whalebrew/tree/master/LICENSE) for full details.

## Credits

Special thanks to the [maintainers and contributors](https://github.com/whalebrew/whalebrew/graphs/contributors) of Whalebrew!

See [docs/credits.md](https://github.com/aidanmelen/terraform-shell-whalebrew/tree/master/docs/credits.md) for full details.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| shell | 1.7.3 |

## Providers

| Name | Version |
|------|---------|
| shell | 1.7.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| whalebrew\_images | Images to install with Whalebrew. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| whalebrew\_list | A list of packages installed with Whalebrew. Also see `whalebrew list`. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
