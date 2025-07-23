Based on your inputs:
Project ID: sunny_project
Dataset ID: cap_dataset
Table ID: drivers
Bucket: cap_bucket
VM Zone: us-central1-a
Region: default to us-central1
VM Name: cap-vm 



commands :

terraform init
terraform plan      # Will use terraform.tfvars automatically
terraform apply     # Will also use terraform.tfvars

# terraform apply -var-file="prod.tfvars"
