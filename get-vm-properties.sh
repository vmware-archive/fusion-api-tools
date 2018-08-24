#!/bin/sh
# 
# get-vm-properties.sh
# Written by: Michael Roy (@mikeroySoft) 
#
# Useful example script to show how to call the VMware Fusion REST API
# using simple cURL and bash scripting to get the properties of
# a single VM
# 
# Now includes colorized output! Fancy!
#
# Check out the API reference, getting started guide, and
# other samples at https://code.vmware.com/apis/fusion
# for more information on how to configure Fusion to enable the REST
# API

# For this to work you must have the following installed:
#
# pip
# pygments
# json (formerly jsontools, includes json bin)
# 
# To install pip : sudo easy_install pip
# To install pygments using pip: sudo pip install Pygments
# To (globally) install json: npm install -g json

FUSION_HOST="localhost:8697"
AUTH_STRING="REPLACE WITH YOUR AUTHORIZATION STRING"

echo Please provide the ID of the VM you want to get properties for

read vm_id

# set vm_id as $VM_ID
VM_ID=$vm_id

echo You typed ${VM_ID}
echo continuing...
echo ...
echo ...


# use curl to call the REST API, returning json

curl "http://${FUSION_HOST}/api/vms/${VM_ID}" -X GET --header "Accept: application/vnd.vmware.vmw.rest-v1+json" --header "Authorization: Basic ${AUTH_STRING}" | json | pygmentize -l json

