# Terraform - AWS - EKS - via the terraform-aws-modules/terraform-aws-eks Module

We will creatie an EKS cluster via the terraform-aws-modules/terraform-aws-eks module on the Terraform Registry.

You may want to set the following variables:

- region

```
terraform init
```

```
terraform validate
```

```
terraform plan
```

```
terraform apply --auto-approve
```

```
terraform destroy --auto-approve 
```

When the Terraform code has executed, a kubeconfig file will be output in the root folder.

This file does require the aws-iam-authenticator to be installed on your machine.

See: https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html

Instruct kubectl to use this kubeconfig file:

```
export KUBECONFIG=kubeconfig_[RANDOM]
```

To get nodes:

```
kubectl get no
```