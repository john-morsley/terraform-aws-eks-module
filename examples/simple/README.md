# A Multiple Node cluster

This is an example of a multiple node kubernetes cluster on AWS with an EKS (Elastic Kubernetes Service).

The module utilises the AWS EKS module:

# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

To create:

```shell
terraform init
terraform apply --auto-approve
```

Once run, check deployment is successful by using the load_balancer_ul in the outputs:

```shell
curl a64229326eb1d47139847825d5fd6156-2059899783.eu-west-2.elb.amazonaws.com
```

```
<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx</center>
</body>
</html>
```

From outputs, grab the export_kubeconfig_command:

```shell
export KUBECONFIG=k8s/kubeconfig.yaml
```

Let's have a look at the nodes:

```shell
kubectl get no
```

```
NAME                                         STATUS   ROLES    AGE   VERSION
ip-172-31-2-123.eu-west-2.compute.internal   Ready    <none>   7m    v1.18.9-eks-d1db3c
ip-172-31-6-154.eu-west-2.compute.internal   Ready    <none>   7m    v1.18.9-eks-d1db3c
```

Let's have a look at everything else:

```shell
kubectl get all -A
```

```
NAMESPACE       NAME                                                        READY   STATUS    RESTARTS   AGE
ingress-nginx   pod/eks-ingress-ingress-nginx-controller-7bbb4db46c-696jj   1/1     Running   0          98s
kube-system     pod/aws-node-bjhsf                                          1/1     Running   0          2m13s
kube-system     pod/aws-node-zlbmh                                          1/1     Running   0          2m13s
kube-system     pod/coredns-68f9865c64-6jjmc                                1/1     Running   0          7m12s
kube-system     pod/coredns-68f9865c64-7xdnp                                1/1     Running   0          7m12s
kube-system     pod/kube-proxy-66h4k                                        1/1     Running   0          2m13s
kube-system     pod/kube-proxy-f46vd                                        1/1     Running   0          2m13s

NAMESPACE       NAME                                                     TYPE           CLUSTER-IP      EXTERNAL-IP                                                               PORT(S)                      AGE
default         service/kubernetes                                       ClusterIP      10.100.0.1      <none>                                                                    443/TCP                      7m26s
ingress-nginx   service/eks-ingress-ingress-nginx-controller             LoadBalancer   10.100.129.1    a64229326eb1d47139847825d5fd6156-2059899783.eu-west-2.elb.amazonaws.com   80:31752/TCP,443:30626/TCP   98s
ingress-nginx   service/eks-ingress-ingress-nginx-controller-admission   ClusterIP      10.100.115.48   <none>                                                                    443/TCP                      98s
kube-system     service/kube-dns                                         ClusterIP      10.100.0.10     <none>                                                                    53/UDP,53/TCP                7m21s

NAMESPACE     NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
kube-system   daemonset.apps/aws-node     2         2         2       2            2           <none>          7m21s
kube-system   daemonset.apps/kube-proxy   2         2         2       2            2           <none>          7m21s

NAMESPACE       NAME                                                   READY   UP-TO-DATE   AVAILABLE   AGE
ingress-nginx   deployment.apps/eks-ingress-ingress-nginx-controller   1/1     1            1           98s
kube-system     deployment.apps/coredns                                2/2     2            2           7m21s

NAMESPACE       NAME                                                              DESIRED   CURRENT   READY   AGE
ingress-nginx   replicaset.apps/eks-ingress-ingress-nginx-controller-7bbb4db46c   1         1         1       98s
kube-system     replicaset.apps/coredns-68f9865c64                                2         2         2       7m13s
```

To destroy:

```shell
terraform destro --auto-approve
```