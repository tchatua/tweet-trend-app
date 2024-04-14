# tweet-trend-app
This is a small application which contains main and test folders.   
Main contains application code.   
Test contains test cases.

It also contains pom.xml which has all dependencies and artifact name and version


## Install Java 11 on Amazon Linux 2
sudo amazon-linux-extras enable java-openjdk11
sudo yum install java-11-openjdk-devel


/usr/lib/jvm/java-11-openjdk-11.0.22.0.7-1.amzn2.0.1.x86_64/bin/java


```yml

def server = Artifactory.newServer url: 'artifactory-url', credentialsId: 'ccrreeddeennttiiaall'

// If Jenkins is configured to use an http proxy, you can bypass the proxy when using this Artifactory server:  
server.bypassProxy = true
// If you're using username and password:
server.username = 'new-user-name'
server.password = 'new-password'
// If you're using Credentials ID:
server.credentialsId = 'ccrreeddeennttiiaall'
// Configure the connection timeout (in seconds).
// The default value (if not configured) is 300 seconds:  
server.connection.timeout = 300

def uploadSpec = """{
  "files": [
    {
      "pattern": "bazinga/*froggy*.zip",
      "target": "bazinga-repo/froggy-files/"
    }
 ]
}"""
server.upload spec: uploadSpec 
```

## Helm

```sh
helm version
version.BuildInfo{Version:"v3.14.3", GitCommit:"f03cc04caaa8f6d7c3e67cf918929150cf6f3f12", GitTreeState:"clean", GoVersion:"go1.21.7"}

helm ls
NAME    NAMESPACE       REVISION        UPDATED STATUS  CHART   APP VERSION

```  

### ############################################
###     Helm chart deployment using jenkins
### ############################################

```sh
K8s:>$
helm ls
# <!-- NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
# agtapp-v1.0     default         1               2024-04-07 04:04:59.029046335 +0000 UTC deployed        agtapp-0.1.0    1.16.0      -->

helm uninstall agtapp-v1.0
# release "agtapp-v1.0" uninstalled
``` 

1. To create a helm chart template 
   ```sh 
   helm create agtapp
   ```

    by default, it contains 
    - values.yaml
    - templates
    - Charts.yaml
    - charts

2. Replace the template directory with the manifest files and package it
   ```sh
   helm package agtapp
   <!-- Successfully packaged chart and saved it to: /home/ec2-user/kubernetes/a02_deploy_with_helm_charts/agtapp-0.1.0.tgz -->
   ```
3. Change the version number in the 
   ```sh 
   helm install agtapp agtapp-0.1.0.tgz
   ```

4. Create a jenkins job for the deployment 
   ```sh 
   stage(" Deploy ") {
          steps {
            script {
               echo '<--------------- Helm Deploy Started --------------->'
               sh 'helm install agtapp agtapp-0.1.0.tgz'
               echo '<--------------- Helm deploy Ends --------------->'
            }
          }
        }
   ```

5. To list installed helm deployments
   ```sh 
   helm list -a
   ```

Other useful commands
1. to change the default namespace to valaxy
   ```sh
   kubectl config set-context --current --namespace=dev
   ```
#### ############################################
#### Prometheus setup
#### ############################################

##### pre-requisites
1. Kubernetes cluster
2. helm

```sh
kubectl get all 
helm version
```

##### Setup Prometheus

1. Create a dedicated namespace for prometheus 
```sh
kubectl create namespace monitoring
```

2. Add Prometheus helm chart repository
```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 
```

3. Update the helm chart repository
```sh
helm repo update
helm repo list
```

4. Install the prometheus

```sh
 helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
```

5. Above helm create all services as ClusterIP. To access Prometheus out side of the cluster, we should change the service type load balancer
```sh 
kubectl edit svc prometheus-kube-prometheus-prometheus -n monitoring

```

###### Login into Prometheus dashboard

6. Loginto Prometheus dashboard to monitor application
   https://ELB:9090

7. Check for node_load15 executor to check cluster monitoring 

###### Grafana

8. We check similar graphs in the Grafana dashboard itself. for that, we should change the service type of Grafana to LoadBalancer
```sh 
kubectl edit svc prometheus-grafana --namespace monitoring
```

9.  To login to Grafana account, use the below username and password 
    ```sh
    username: admin
    password: prom-operator
    ```
10. Here we should check for "Node Exporter/USE method/Node" and "Node Exporter/USE method/Cluster"
    USE - Utilization, Saturation, Errors
   
11. Even we can check the behavior of each pod, node, and cluster 

```sh
kubectl get all -n monitoring
NAME                                                         READY   STATUS    RESTARTS   AGE
pod/alertmanager-prometheus-kube-prometheus-alertmanager-0   2/2     Running   0          36m
pod/prometheus-grafana-86b6d8f896-x9zg9                      3/3     Running   0          36m
pod/prometheus-kube-prometheus-operator-54577f779b-w7b7q     1/1     Running   0          36m
pod/prometheus-kube-state-metrics-c8f945cbb-d4kzk            1/1     Running   0          36m
pod/prometheus-prometheus-kube-prometheus-prometheus-0       2/2     Running   0          36m
pod/prometheus-prometheus-node-exporter-52hmk                1/1     Running   0          36m
pod/prometheus-prometheus-node-exporter-bb9wf                1/1     Running   0          36m

NAME                                              TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/alertmanager-operated                     ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   36m
service/prometheus-grafana                        ClusterIP   10.100.37.33     <none>        80/TCP                       36m
service/prometheus-kube-prometheus-alertmanager   ClusterIP   10.100.171.212   <none>        9093/TCP,8080/TCP            36m
service/prometheus-kube-prometheus-operator       ClusterIP   10.100.105.228   <none>        443/TCP                      36m
service/prometheus-kube-prometheus-prometheus     ClusterIP   10.100.182.54    <none>        9090/TCP,8080/TCP            36m
service/prometheus-kube-state-metrics             ClusterIP   10.100.95.67     <none>        8080/TCP                     36m
service/prometheus-operated                       ClusterIP   None             <none>        9090/TCP                     36m
service/prometheus-prometheus-node-exporter       ClusterIP   10.100.86.200    <none>        9100/TCP                     36m

NAME                                                 DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/prometheus-prometheus-node-exporter   2         2         2       2            2           kubernetes.io/os=linux   36m

NAME                                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/prometheus-grafana                    1/1     1            1           36m
deployment.apps/prometheus-kube-prometheus-operator   1/1     1            1           36m
deployment.apps/prometheus-kube-state-metrics         1/1     1            1           36m

NAME                                                             DESIRED   CURRENT   READY   AGE
replicaset.apps/prometheus-grafana-86b6d8f896                    1         1         1       36m
replicaset.apps/prometheus-kube-prometheus-operator-54577f779b   1         1         1       36m
replicaset.apps/prometheus-kube-state-metrics-c8f945cbb          1         1         1       36m

NAME                                                                    READY   AGE
statefulset.apps/alertmanager-prometheus-kube-prometheus-alertmanager   1/1     36m
statefulset.apps/prometheus-prometheus-kube-prometheus-prometheus       1/1     36m
```
