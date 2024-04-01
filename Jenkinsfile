// def registry = 'https://goumgue81.jfrog.io'
pipeline {
    agent {
        node {
            label 'maven-label'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
    // JAVA_HOME = "/usr/lib/jvm/java"
}
    stages {
        stage ("build") {
            // tools {
            //     jdk 'java-jdk-11'
            // }
            steps {
                sh 'mvn clean deploy'
            }
        }
        // stage ("SonarQube analysis") {
        //     tools {
        //         jdk 'java-jdk-17'
        //     }
        //     environment { 
        //         scannerHome = tool 'dwp-sonarqube-scanner-name'
        //     }
        //     steps {
        //         withSonarQubeEnv('dwp-sonarqube-server-server') {
        //             sh "${scannerHome}/bin/sonar-scanner"
        //         }
        //     }
        // }
        // stage("Jar Publish") {
        //     steps {
        //         script {
        //             echo '<--------------- Jar Publish Started --------------->'
        //             def server = Artifactory.newServer url:registry+"/artifactory" ,  credentialsId:"jfrog-credential-id"
        //             def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
        //             def uploadSpec = """{
        //                 "files": [
        //                     {
        //                         "pattern": "jarstaging/(*)",
        //                         "target": "libs-release-local/{1}",
        //                         "flat": "false",
        //                         "props" : "${properties}",
        //                         "exclusions": [ "*.sha1", "*.md5"]
        //                     }
        //                 ]
        //             }"""
        //             def buildInfo = server.upload(uploadSpec)
        //             buildInfo.env.collect()
        //             server.publishBuildInfo(buildInfo)
        //             echo '<--------------- Jar Publish Ended --------------->'
        //         }
        //     }
        // }
    }  
}