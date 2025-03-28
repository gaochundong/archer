# 在 MacOS 中使用 multipass 安装 microk8s 环境

## Multipass & MicroK8s

### What is Kubernetes?

Kubernetes clusters host containerised applications in a reliable and scalable way. Having DevOps in mind, Kubernetes makes maintenance tasks such as upgrades dead simple.

### What is Multipass?

Multipass is a lightweight VM manager for Linux, Windows and macOS. It’s designed for developers who want a fresh Ubuntu environment with a single command. It uses KVM on Linux, Hyper-V on Windows and HyperKit on macOS to run the VM with minimal overhead. It can also use VirtualBox on Windows and macOS. Multipass will fetch images for you and keep them up to date.

### What is MicroK8s?

MicroK8s is a CNCF certified upstream Kubernetes deployment that runs entirely on your workstation or edge device. Being a snap it runs all Kubernetes services natively (i.e. no virtual machines) while packing the entire set of libraries and binaries needed. Installation is limited by how fast you can download a couple of hundred megabytes and the removal of MicroK8s leaves nothing behind.

## 安装过程

### 安装 multipass 服务

```bash
brew search multipass
brew cask info multipass
brew cask install multipass
multipass version
```

### 通过 multipass 安装和启动 microk8s 环境

```bash
multipass launch --name microk8s-vm --mem 4G --disk 40G
multipass list
multipass stop microk8s-vm
multipass delete microk8s-vm 
multipass purge 
```

### 在虚机中安装 microk8s 服务

```bash
multipass exec microk8s-vm -- sudo snap install microk8s --classic
multipass exec microk8s-vm -- sudo iptables -P FORWARD ACCEPT

# microk8s部分版本有问题，可先删除，再指定版本安装
sudo snap remove --purge microk8s
sudo snap install microk8s --classic --channel=1.28/stable

# 查看安装的microk8s版本，若microk8s没启动起来，可以inspect并通过events分析原因
sudo snap list
sudo microk8s version
sudo microk8s status
sudo microk8s inspect
sudo microk8s kubectl get all --all-namespaces
sudo microk8s kubectl get events --all-namespaces
microk8s kubectl events --all-namespaces
```

### 查看 microk8s 的 snap 包信息，比如版本信息

```bash
multipass exec microk8s-vm -- sudo snap info microk8s
```

### 增加账号访问权限，简化操作

```bash
# 默认 ubuntu 账号无权限操作集群，均需要 sudo
# 可将 ubuntu 账号加入 microk8s 用户组以便简化访问
multipass exec microk8s-vm -- sudo usermod -a -G microk8s ubuntu
multipass exec microk8s-vm -- sudo chown -f -R ubuntu ~/.kube
```

### 增加访问公钥，简化操作

```bash
# 在 ~/.ssh/authorized_keys 增加自己的公钥，则可方便的进行SSH登录
multipass shell microk8s-vm
ssh ubuntu@192.168.64.2
# 本机电脑.ssh用的私钥，authorized_keys中配置的是公钥
# 本机电脑提示后会修改known_hosts，添加IP地址
```

### 查看磁盘空间

```bash
multipass exec microk8s-vm -- df -kh
```

### 查看 kubeconfig 配置

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.config
```

### 配置端口转发

```bash
# 端口转发dashboard地址
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0

# Chrome浏览器访问 https://192.168.64.6:10443 如下命令获取Token
microk8s kubectl describe secret -n kube-system microk8s-dashboard-token
```

### 在 kubeconfig 中可以找到集群信息，可登录查看

```bash
server: https://192.168.64.2:16443
username: admin
password: xxx
```

### 增加 DNS 插件，必须安装，多处依赖使用

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.enable dns
multipass exec microk8s-vm -- /snap/bin/microk8s.enable dashboard
```

### 查看集群信息，可列出各系统应用的访问地址

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl cluster-info
```

### 尝试访问 Grafana 地址

```bash
https://192.168.64.2:16443/api/v1/namespaces/kube-system/services/monitoring-grafana/proxy
```

### 安装 Dashboard UI

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
```

### 使用 Bearer Token 进行鉴权访问

```bash
# 为安全考虑，Dashboard UI 需要使用 Bearer Token 进行鉴权访问，使用如下命令获取 Token
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl -n kube-system describe secret default-token-qqt75
```

### 访问 Dashboard UI

```bash
https://192.168.64.2:16443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

### 查看集群组件状态

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.status
```

### 可通过指定配置文件进行访问

```bash
# 把kubeconfig保存至本地 /Users/gaochundong/.kube/microk8s-vm.yml，则可通过指定配置文件进行访问
kubectl --insecure-skip-tls-verify --kubeconfig="/Users/gaochundong/.kube/microk8s-vm.yml" get pods --all-namespaces

# 把kubeconfig保存至本地 ~/.kube/config，则可通过指定配置文件进行访问
kubectl --insecure-skip-tls-verify get pods --all-namespaces
```

### 安装 registry 组件

```bash
# The MicroK8s registry will not be enabled by default, so needs run the following to enable it.
multipass exec microk8s-vm -- /snap/bin/microk8s.enable registry
```

### 查看集群内组件状态

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.status | grep enabled
```

### Demo 代码

```bash
https://github.com/gaochundong/urbanboot

urban-iptable-management # 简单的IP地址查询服务，服务自治，无外部依赖
urban-district-management # 简单的省市区查询服务，服务自治，无外部依赖
urban-traffic-management # 简单的模拟服务间调用，依赖 district 服务查询城市信息
urban-gateway-management # 模拟API网关，将访问转发至其他服务
```

### 本地 docker image 构建

```bash
cd urbanboot

docker build -t urban-iptable-management-app:latest --file ./urban-iptable-management/docker/Dockerfile .
docker build -t urban-district-management-app:latest --file ./urban-district-management/docker/Dockerfile .
docker build -t urban-traffic-management-app:latest --file ./urban-traffic-management/docker/Dockerfile .
docker build -t urban-gateway-management-app:latest --file ./urban-gateway-management/docker/Dockerfile .
```

### 删除无用镜像

```bash
docker images
docker rmi --force $(docker images | grep "^<none>" | awk '{print $3}')
docker images
```

### 保存本地镜像至文件

```bash
# Save one or more images to a tar archive
docker save -o urban-iptable-management-app.tar urban-iptable-management-app:latest
docker save -o urban-district-management-app.tar urban-district-management-app:latest
docker save -o urban-traffic-management-app.tar urban-traffic-management-app:latest
docker save -o urban-gateway-management-app.tar urban-gateway-management-app:latest

# Container Runtimes Part 3: High-Level Runtimes
https://www.ianlewis.org/en/container-runtimes-part-3-high-level-runtimes
```

### 拷贝镜像文件至 microk8s 机器

```bash
scp ./urban-iptable-management-app.tar ubuntu@192.168.64.2:/tmp
scp ./urban-district-management-app.tar ubuntu@192.168.64.2:/tmp
scp ./urban-traffic-management-app.tar ubuntu@192.168.64.2:/tmp
scp ./urban-gateway-management-app.tar ubuntu@192.168.64.2:/tmp
```

### 安装镜像至 registry

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr namespaces list
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images list -q

multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images import /tmp/urban-iptable-management-app.tar
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images import /tmp/urban-district-management-app.tar
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images import /tmp/urban-traffic-management-app.tar
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images import /tmp/urban-gateway-management-app.tar

multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images list -q | grep urban
```

### 删除镜像

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images remove docker.io/library/urban-iptable-management-app:latest
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images remove docker.io/library/urban-district-management-app:latest
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images remove docker.io/library/urban-traffic-management-app:latest
multipass exec microk8s-vm -- /snap/bin/microk8s.ctr images remove docker.io/library/urban-gateway-management-app:latest
```

### 在部署文件中配置镜像位置

```bash
# 替换deployment.yaml文件中的image路径
/Users/gaochundong/g/github/urbanboot/urban-district-management/kubernetes/deployment.yaml
```

### 创建 Namespace

```bash
kubectl --insecure-skip-tls-verify create namespace urbanboot
```

### 部署应用

```bash
kubectl --insecure-skip-tls-verify apply -f /Users/gaochundong/g/github/urbanboot/urban-iptable-management/kubernetes/deployment.yaml -n urbanboot
kubectl --insecure-skip-tls-verify apply -f /Users/gaochundong/g/github/urbanboot/urban-district-management/kubernetes/deployment.yaml -n urbanboot
kubectl --insecure-skip-tls-verify apply -f /Users/gaochundong/g/github/urbanboot/urban-traffic-management/kubernetes/deployment.yaml -n urbanboot
kubectl --insecure-skip-tls-verify apply -f /Users/gaochundong/g/github/urbanboot/urban-gateway-management/kubernetes/deployment.yaml -n urbanboot
```

### 查看部署

```bash
kubectl --insecure-skip-tls-verify get deployments -n urbanboot
kubectl --insecure-skip-tls-verify get pods -n urbanboot
```

### 删除部署，会自动删除 Pods

```bash
kubectl --insecure-skip-tls-verify delete deployment urban-iptable-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete deployment urban-district-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete deployment urban-traffic-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete deployment urban-gateway-management-app -n urbanboot
```

```bash
# Build apps locally and Deploy on MicroK8s
https://medium.com/manikkothu/build-and-deploy-apps-on-microk8s-1df26d1ddd3c
```

### 创建 Service

```bash
kubectl --insecure-skip-tls-verify get services -n urbanboot
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose -h

multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-iptable-management-app --type=ClusterIP --port=7200 --name=urban-iptable-management-app -n urbanboot
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-iptable-management-app --type=NodePort --port=7200 --name=urban-iptable-management-nodeport -n urbanboot

multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-district-management-app --type=ClusterIP --port=7200 --name=urban-district-management-app -n urbanboot
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-district-management-app --type=NodePort --port=7200 --name=urban-district-management-nodeport -n urbanboot

multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-traffic-management-app --type=ClusterIP --port=7200 --name=urban-traffic-management-app -n urbanboot
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-traffic-management-app --type=NodePort --port=7200 --name=urban-traffic-management-nodeport -n urbanboot

multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-gateway-management-app --type=ClusterIP --port=7200 --name=urban-gateway-management-app -n urbanboot
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-gateway-management-app --type=NodePort --port=7200 --name=urban-gateway-management-nodeport -n urbanboot

# https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0
# The big downside is that each service you expose with a LoadBalancer will get its own IP address, and you have to pay for a LoadBalancer per exposed service, which can get expensive!
```

```bash
multipass exec microk8s-vm -- /snap/bin/microk8s.kubectl expose deployment urban-traffic-management-app --type=LoadBalancer --port=7200 --name=urban-traffic-management-loadbalancer -n urbanboot
```

### 使用配置文件创建 Service

```bash
kubectl --insecure-skip-tls-verify expose -f /Users/gaochundong/g/github/urbanboot/urban-traffic-management/kubernetes/service.yaml -n urbanboot
kubectl --insecure-skip-tls-verify expose -f /Users/gaochundong/g/github/urbanboot/urban-traffic-management/kubernetes/nodeport.yaml -n urbanboot
```

### 删除 Service

```bash
kubectl --insecure-skip-tls-verify delete service urban-iptable-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-iptable-management-nodeport -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-district-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-district-management-nodeport -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-traffic-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-traffic-management-nodeport -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-gateway-management-app -n urbanboot
kubectl --insecure-skip-tls-verify delete service urban-gateway-management-nodeport -n urbanboot
```

### 查一下 TCP 端口监听

```bash
multipass exec microk8s-vm -- netstat -nl -t
```

### 查看部署事件，按照时间排序

```bash
kubectl --insecure-skip-tls-verify get events -n urbanboot --sort-by=.metadata.creationTimestamp
```

### 查看 Pod  信息

```bash
kubectl --insecure-skip-tls-verify get pods -n urbanboot
kubectl --insecure-skip-tls-verify describe pod urban-traffic-management-app-58d7578547-p277h -n urbanboot
```

### 查看 Endpoint 信息

```bash
# Spring Cloud Kubernetes 会通过 API 查询 Endpoints
kubectl --insecure-skip-tls-verify get services -n urbanboot
kubectl --insecure-skip-tls-verify get endpoints -n urbanboot
kubectl --insecure-skip-tls-verify get all --all-namespaces
kubectl --insecure-skip-tls-verify get all -n urbanboot
kubectl --insecure-skip-tls-verify describe services urban-traffic-management-nodeport -n urbanboot
kubectl --insecure-skip-tls-verify describe services urban-traffic-management-app -n urbanboot
```

### 访问 NodePort 端口

```bash
curl -s http://192.168.64.2:30211
curl -s http://192.168.64.2:30211 -i
curl -s http://192.168.64.2:30211 -v
```

### 查看 Pod 日志

```bash
kubectl --insecure-skip-tls-verify logs urban-traffic-management-app-58d7578547-p277h -n urbanboot
kubectl --insecure-skip-tls-verify logs urban-traffic-management-app-58d7578547-p277h -n urbanboot --tail=20
```

### 登录 Pod 环境

```bash
kubectl --insecure-skip-tls-verify exec -it urban-traffic-management-app-58d7578547-p277h -n urbanboot -- /bin/bash
```

### 查看 Java 进程

```bash
java -version
env | grep JAVA
java -server -jar -Xmn64M -Xms64M -Xmx1024M -Dserver.port=7201 -Dspring.cloud.consul.enabled=false -Dspring.cloud.kubernetes.enabled=false -Dspring.cloud.kubernetes.ribbon.enabled=false -Duser.dir=/opt/urbanboot/urban-traffic-management /opt/urbanboot/urban-traffic-management/urban-traffic-management-app.jar
```
