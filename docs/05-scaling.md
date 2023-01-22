# Server Profiles at Scale

In previous sections, each server profile type was for a single deployment. Automation for one time deployments has value but that value can be offset substantially by the effort to build the automation itself. In this section, we are going to turn it up to 11 and deploy multiple instances of our policy.

There are two general approaches, depending on how coupled or decoupled you want your policies to be:

- Many profiles, single set of policies
- Terraform Modules

In this last section, though, we'll focus primarily on the first option as that more generally follows the best practices of UCS environments.

## Many Profiles

In this approach, the power of the policy buckets approach to modeling will really shine. In the Terraform code for this section (a copy of the Intersight managed profile), our task is simply to leverage the "count" feature of Terraform and apply it to the server profile resource itself.

Navigate in the editor window to the right to the server.tf file (**src/DEVWKS-2060-CLUS22/04-scaling/server.tf**). You'll uncomment the two lines related to our task - containing the count and name attributes - and comment out the second name attribute. By doing so, you are instructing Terraform to create the specified number of copies and to adjust the name based on the index of the copy.

The final result of that portion should look like this:

```hcl
  count             = 4
  name              = "SrvProf-intersight${count.index + 1}"
  description       = "Terraform deployed"
  # name              = "SrvProf-intersight"
  target_platform   = "FIAttached"
  uuid_address_type = "POOL"
```

Note: You can set the count value to anything from 0 to 10, just don't exceed 10 as the various pools that have been defined only have a size of 10 in most cases.

Additionally, there is a second change required. The output variable at the end of the file must also be updated to account for the change - namely the objects generated will now be a list of resources instead of a singular resource.

The output portion of Terraform configuration should resemble the following when you have finished the adjustments:

```hcl
output "intersight_sp_moid" {
  value = [intersight_server_profile.intersight.*.moid]
  # value = intersight_server_profile.intersight.moid
}
```

Let's deploy out replicas of the server profile:

```bash
cd ${HOME}/src/DEVWKS-2060-CLUS22/04-scaling
terraform init
terraform plan
terraform apply --auto-approve
```

Your output will now look slightly different from the single server approach:

```
intersight_server_profile.intersight[2]: Creation complete after 1s [id=628d206377696e2d336ecc4e]
intersight_server_profile.intersight[1]: Creation complete after 2s [id=628d206477696e2d336ecc76]
intersight_server_profile.intersight[0]: Creation complete after 3s [id=628d206477696e2d336ecce3]
intersight_server_profile.intersight[3]: Creation complete after 4s [id=628d206777696e2d336ecd66]

Apply complete! Resources: 51 added, 0 changed, 0 destroyed.

Outputs:

intersight_sp_moid = [
  [
    "628d206477696e2d336ecce3",
    "628d206477696e2d336ecc76",
    "628d206377696e2d336ecc4e",
    "628d206777696e2d336ecd66",
  ],
]
org_target_moid = "62880a126972652d313967ab"
```

Now, we are going to blow your mind. What happens when your management surprises you and 8 servers showed up instead of 4? No problem, use the editor window to change count to be 8, instead of 4:

```hcl
  count             = 8
  name              = "SrvProf-intersight${count.index + 1}"
  description       = "Terraform deployed"
  # name              = "SrvProf-intersight"
  target_platform   = "FIAttached"
  uuid_address_type = "POOL"
```

Now apply that change:

```bash
terraform apply --auto-approve
```

Like magic, we have added 4 server profiles:

```
intersight_server_profile.intersight[7]: Creating...
intersight_server_profile.intersight[5]: Creating...
intersight_server_profile.intersight[4]: Creating...
intersight_server_profile.intersight[6]: Creating...
intersight_server_profile.intersight[5]: Creation complete after 2s [id=628d225977696e2d336ef31e]
intersight_server_profile.intersight[4]: Creation complete after 2s [id=628d225a77696e2d336ef346]
intersight_server_profile.intersight[6]: Creation complete after 2s [id=628d225a77696e2d336ef36c]
intersight_server_profile.intersight[7]: Creation complete after 2s [id=628d225a77696e2d336ef38f]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

intersight_sp_moid = [
  [
    "628d206477696e2d336ecce3",
    "628d206477696e2d336ecc76",
    "628d206377696e2d336ecc4e",
    "628d206777696e2d336ecd66",
    "628d225a77696e2d336ef346",
    "628d225977696e2d336ef31e",
    "628d225a77696e2d336ef36c",
    "628d225a77696e2d336ef38f",
  ],
]
org_target_moid = "62880a126972652d313967ab"
```

We'll skip the exercise but, if you set count to 0, all the server profiles will be cleaned up but the core policies and pools will remain and be unused.

## Leave No Trace

Please clean up after yourselves so that the next group of attendees will have a wonderful experience.

```bash
terraform destroy --auto-approve
```

Remember: Because of parallelism in the provider and API, you'll likely have to run this more than once until there are no errors.
