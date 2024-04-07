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
