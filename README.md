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


