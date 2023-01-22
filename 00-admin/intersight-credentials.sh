#!/usr/bin/env bash

# Provide Intersight credentials via Terraform environment variables
# externally to repository via:
#     https://www.terraform.io/cli/config/environment-variables

if test -z "${SECURE}"; then
    echo "SECURE env var not defined."
else;
    echo "Setting TF_VAR variables"
    export TF_VAR_apikey=$(cat ${SECURE}/DEVWKS-2060-Default-KeyID.txt)
    export TF_VAR_secretkey="${SECURE}/DEVWKS-2060-Default-Secret.txt"
fi
