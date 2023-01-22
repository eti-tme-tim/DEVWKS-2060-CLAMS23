#!/usr/bin/env bash

# Provide Intersight credentials via Terraform environment variables
# externally to repository via:
#     https://www.terraform.io/cli/config/environment-variables

if test -z "${SECURE}"; then
    echo "SECURE env var not defined. Using PWD..."
    export SECURE="${PWD}"
fi

echo "Setting TF_VAR variables using directory ${SECURE}"
export TF_VAR_apikey=$(cat ${SECURE}/DEVWKS-2060-Default-KeyID.txt)
export TF_VAR_secretkey="${SECURE}/DEVWKS-2060-Default-Secret.txt"

if test -z "${TF_VAR_target_organization}"; then
    echo "TF_VAR_target_organization is not defined. Using 'default' but could be wrong"
    export TF_VAR_target_organization=default
fi

