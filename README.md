# Edgescan Cloudhook AWS User Integration

A Terraform template to generate an AWS IAM User for automated Edgescan onboarding.

This Terraform Template will generate:

- An IAM User with the following policies:
    - AmazonEC2ReadOnlyAccess
    - AmazonRoute53ReadOnlyAccess
    - An inline policy to fetch the AWS account's alias

- Access key credentials for this IAM User.

## Prerequisites
### 1. Installing Terraform

The official instructions on installing Terraform can be found here: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### 2. Installing AWS CLI

The official instructions on installing the AWS CLI can be found here: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Instructions on running this template

1. Initialise the Terraform Template by running:

   ```
   terraform init
   ```

2. Apply the template by running:

   ```
   terraform apply
   ```

   Alternatively, if you want to set the username of the AWS IAM User (to match company naming policies), you can instead apply the template with the command:

   ```
   template apply -var="username=<your custom username>"
   ```

3. The apply command will list the AWS resources that will be created, and prompt you to apply these changes with 'y'.

3. At the end of the terraform apply, the **access key id** and **secret access key** will be listed. Take note of both of these keys and provide them to edgescan.# edgescan-cloudhook-aws-user-integration
