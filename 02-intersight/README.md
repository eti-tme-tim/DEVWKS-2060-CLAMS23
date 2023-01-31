# Creating 3 Intersight Policies

In this directory, students of the workshop will leverage Intersight API docs and Terraform provider docs to build three distinct UCS Server policies within the platform using Terraform:

- [IPKVM policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kvm_policy)
- [IPMI policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ipmioverlan_policy)
- [Serial over LAN policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/sol_policy)

In summary, the goal of the challenge is to:

- Enable IPKVM, with a maximum of 4 sessions, unencrypted, on the standard port 2069. The local server video should be enabled as well.
- Disable IPMI over LAN
- Disable Serial over LAN

Solutions are found in the [solutions](./solutions/) directory.

## Requirements

- Define environment variables securely to authenticate with Intersight
    - TF_VARS_apikey with the string of the API Key ID
    - TF_VAR_secretkey with the full path filename to the Secret Key file.

- Define environment variable to identify your workshop organization
    - TF_VAR_target_organization, with the name given at your workstation (e.g. studentX)

An example set of commands to set up those pre-requisites would be:

```bash
export TF_VARS_apikey=abc8939278ca0d0e8gf67365581ba3
export TF_VARS_secretkey=$HOME/intersight.private.key.txt
export TF_VAR_target_organization=student42
```

Once the correct organization is specified, test your Terraform credentials via the usual Terraform workflow.

```bash
terraform init
terraform plan
terraform apply --auto-approve
```
