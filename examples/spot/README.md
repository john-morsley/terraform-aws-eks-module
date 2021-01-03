# A Multiple Node cluster - With Spot Instances


```shell
kubectl get no
```

```
NAME                                       STATUS   ROLES    AGE    VERSION
ip-10-0-2-115.eu-west-2.compute.internal   Ready    <none>   2m     v1.18.9-eks-d1db3c
ip-10-0-2-186.eu-west-2.compute.internal   Ready    <none>   116s   v1.18.9-eks-d1db3c
ip-10-0-2-73.eu-west-2.compute.internal    Ready    <none>   118s   v1.18.9-eks-d1db3c
ip-10-0-4-145.eu-west-2.compute.internal   Ready    <none>   119s   v1.18.9-eks-d1db3c
ip-10-0-4-27.eu-west-2.compute.internal    Ready    <none>   117s   v1.18.9-eks-d1db3c
ip-10-0-4-86.eu-west-2.compute.internal    Ready    <none>   114s   v1.18.9-eks-d1db3c
ip-10-0-6-131.eu-west-2.compute.internal   Ready    <none>   2m1s   v1.18.9-eks-d1db3c
```

```shell
kubectl get all -A
```

```
NAMESPACE       NAME                                                        READY   STATUS    RESTARTS   AGE
ingress-nginx   pod/eks-ingress-ingress-nginx-controller-7bbb4db46c-x4sfr   1/1     Running   0          111s
kube-system     pod/aws-node-2ffwx                                          1/1     Running   0          2m21s
kube-system     pod/aws-node-52s55                                          1/1     Running   0          2m20s
kube-system     pod/aws-node-5t8v9                                          1/1     Running   0          2m23s
kube-system     pod/aws-node-j6b6t                                          1/1     Running   0          2m18s
kube-system     pod/aws-node-pz6vs                                          1/1     Running   0          2m19s
kube-system     pod/aws-node-r7rf9                                          1/1     Running   0          2m22s
kube-system     pod/aws-node-xpjmz                                          1/1     Running   0          2m16s
kube-system     pod/coredns-68f9865c64-kwqgv                                1/1     Running   0          6m31s
kube-system     pod/coredns-68f9865c64-qbfc7                                1/1     Running   0          6m31s
kube-system     pod/kube-proxy-4c4hp                                        1/1     Running   0          2m22s
kube-system     pod/kube-proxy-bghmb                                        1/1     Running   0          2m21s
kube-system     pod/kube-proxy-bp4xw                                        1/1     Running   0          2m19s
kube-system     pod/kube-proxy-d5mwd                                        1/1     Running   0          2m20s
kube-system     pod/kube-proxy-h4djk                                        1/1     Running   0          2m16s
kube-system     pod/kube-proxy-lklf2                                        1/1     Running   0          2m23s
kube-system     pod/kube-proxy-w9q99                                        1/1     Running   0          2m18s

NAMESPACE       NAME                                                     TYPE           CLUSTER-IP       EXTERNAL-IP                                                              PORT(S)                      AGE
default         service/kubernetes                                       ClusterIP      172.20.0.1       <none>                                                                   443/TCP                      6m42s
ingress-nginx   service/eks-ingress-ingress-nginx-controller             LoadBalancer   172.20.236.192   a4fb416df7c48423abdf589b9ef2d098-976740887.eu-west-2.elb.amazonaws.com   80:31418/TCP,443:30051/TCP   113s
ingress-nginx   service/eks-ingress-ingress-nginx-controller-admission   ClusterIP      172.20.204.66    <none>                                                                   443/TCP                      113s
kube-system     service/kube-dns                                         ClusterIP      172.20.0.10      <none>                                                                   53/UDP,53/TCP                6m40s

NAMESPACE     NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
kube-system   daemonset.apps/aws-node     7         7         7       7            7           <none>          6m40s
kube-system   daemonset.apps/kube-proxy   7         7         7       7            7           <none>          6m40s

NAMESPACE       NAME                                                   READY   UP-TO-DATE   AVAILABLE   AGE
ingress-nginx   deployment.apps/eks-ingress-ingress-nginx-controller   1/1     1            1           113s
kube-system     deployment.apps/coredns                                2/2     2            2           6m40s

NAMESPACE       NAME                                                              DESIRED   CURRENT   READY   AGE
ingress-nginx   replicaset.apps/eks-ingress-ingress-nginx-controller-7bbb4db46c   1         1         1       112s
kube-system     replicaset.apps/coredns-68f9865c64                                2         2         2       6m32s
```