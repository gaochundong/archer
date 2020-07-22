# AWS EKS 集群部署

- 虚拟AWS账号: ```123456789```
- 虚拟公司名称: ```sangmado```
- 虚拟环境名称: ```test``` 环境
- 虚拟集群名称: ```sangmado-test-eks-cluster```
- 如果在中国区，请注意 aws 和 aws-cn 的区分

## 创建 EKS 集群 DevOps 使用的 IAM User

```bash
arn:aws:iam::123456789:user/sangmado-test-eks-cluster-user
```

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor100100",
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::123456789:role/*"
            ]
        },
        {
            "Sid": "VisualEditor100200",
            "Effect": "Allow",
            "Action": [
                "eks:DescribeCluster"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

## 创建 EKS 集群绑定的 Cluster Service Role

```bash
arn:aws:iam::123456789:role/iam@role@sangmado-test-eks-cluster

绑定 Policy: AmazonEKSClusterPolicy
```

编辑该 Role 的 Trust Relationship 中的 Trust Entities

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789:user/sangmado-test-eks-cluster-user",
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

## 创建 EKS Compute 使用的 Node Group IAM Role

由于 NodeGroup 中选择的是 EC2 实例，所以这个 IAM Role 的 Trust Entities是 EC2.

```bash
arn:aws:iam::123456789:role/iam@role@sangmado-test-eks-node-group

绑定 Policy:
AmazonEKSWorkerNodePolicy
AmazonEC2ContainerRegistryReadOnly
AmazonEKS_CNI_Policy
```

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

## 通过 Console 创建 EKS Cluster 集群

- 模拟名称: ```sangmado-test-eks-cluster```
- 选择指定的 VPC
- 选择 Subnets, 通常需要时 private subnets
- 选择 Security Groups, 通常需要对运维网络公开
- Cluster endpoint access 选择 Private
- Configure logging 按需, 可以先Disabled, 后期再打开

## 配置 OpenID Identity Provider

- EKS 集群创建成功后，会生成 OpenID Connect provider URL
- 在 IAM - Identity providers 中，新建 provider，选择 OpenID Connect，填入该URL，Audience 按照 Region 进行填写 ```sts.us-east-1.amazonaws.com```
- 这个配置用于后期针对 Pod 粒度 IAM Role 控制发放 STS Token 使用

## 创建 EC2 SSH key pair

- 准备创建 Worker 前，需要到 EC2 界面创建秘钥，以便指定后可以SSH登录EC2实例

## 创建 Compute Node Group

- 创建完毕 EKS Cluster后，实际 AWS 负责是的 Kubernetes Master 主节点的高可用
- 需要为集群添加 Worker 节点，通过 Node Group 可以添加不同的机型，可以在磁盘大小选择较大的比如100G，避免后期各种磁盘满问题
- 可以选择内存比较大的实例，比如 m5.xlarge 4核16G，避免初期内存不够，后期可优化至 c5.xlarge 等
- 创建完毕 Node Group后，可以到EC2界面查看实例
- 为 Worker 实例补充 Security Groups，以便可以连接
- 同时由于后期 Ingress 或者 Nodeport 的需要，也可以配置开放一些端口

## 生成 kubeconfig

- 生成前，先确认是用什么账号登录的 AWS Console 并创建的 EKS 集群，这个登录账号才拥有管理员权限
- 比如，通过如下命令来确认是否有权限操作 aws 资源

```bash
aws s3 ls --profile saml
```

```bash
aws eks update-kubeconfig --name sangmado-test-eks-cluster --region us-east-1 --profile saml
aws eks update-kubeconfig --name sangmado-test-eks-cluster --region us-east-1 --role-arn arn:aws:iam::123456789:role/iam@role@sangmado-test-eks-cluster --profile saml
```

运行以上命令后，在 ~/.kube 目录下，将生成 config 文件，可通过 ```kubectl config view``` 来查看；
然后就可以通过 ```kubectl get svc``` 来确认是否可以访问 API Server；

## 编辑 aws-auth ConfigMap 权限配置

```bash
kubectl edit configmap aws-auth -n kube-system
kubectl get configmap aws-auth -n kube-system -o yaml
```

在 aws-auth 中配置 user/role 的管理权限角色；

```yaml
apiVersion: v1
data:
  mapRoles: |
    - groups:
      - system:masters
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::123456789:role/iam@role@sangmado-test-eks-cluster
      username: iam@role@sangmado-test-eks-cluster
    - groups:
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::123456789:role/iam@role@sangmado-test-eks-node-group
      username: system:node:{{EC2PrivateDNSName}}
  mapUsers: |
    - userarn: arn:aws:iam::123456789:user/sangmado-test-eks-cluster-user
      username: sangmado-test-eks-cluster-user
      groups:
        - system:masters
kind: ConfigMap
metadata:
  creationTimestamp: "2020-07-22T10:13:10Z"
  name: aws-auth
  namespace: kube-system
  resourceVersion: "6666"
  selfLink: /api/v1/namespaces/kube-system/configmaps/aws-auth
  uid: 6d98e635-6666-6666-6666-0d5f90d65b42
```

若过程中报错，可通过如下命名逐步排查。

```bash
AWS_ACCESS_KEY_ID=xxxxx AWS_SECRET_ACCESS_KEY=yyyyy aws --region us-east-1 eks get-token --cluster-name sangmado-test-eks-cluster --role-arn arn:aws:iam::123456789:role/iam@role@sangmado-test-eks-cluster | jq
```

配置完成后，即可通过 kubectl 命名操作集群资源，比如先创建 namespace :

```bash
kubectl create namespace sangmado
```

## 创建 Pod 使用的 Service Account

部署的 Pod 的 Deployment 中，需要明确指定 ServiceAccountName 为集群中的一个存在的 Service Account

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: sangmado-test-a-micro-service-account
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::123456789:role/iam@role@sangmado-test-a-micro-service
    eks.amazonaws.com/audience: sts.us-east-1.amazonaws.com
```

```bash
kubectl get sa
```

## 创建 Role 并绑定 Service Account

授权该 Service Account 可以访问集群的 endpoints, 以便 Spring Cloud Kubernetes 可以进行服务发现。

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: sangmado-test-role
  namespace: sangmado
rules:
  - apiGroups:
      - ""
    resources:
      - endpoints
      - services
      - pods
    verbs:
      - get
      - list
      - watch

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: sangmado-test-role-binding
  namespace: sangmado
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: sangmado-test-role
subjects:
  - kind: ServiceAccount
    namespace: sangmado
    name: sangmado-test-a-micro-service-account
```
