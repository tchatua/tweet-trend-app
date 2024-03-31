pipeline {
    agent {
        node {
            label 'maven-label'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
}
    stages {
        stage ("build") {
            steps {
                sh 'mvn clean deploy'
            }
        }
        stage ("SonarQube analysis") {
            tools {
                jdk 'java-jdk-17'
            }
            environment { 
                scannerHome = tool 'dwp-sonarqube-scanner-name'
            }
            steps {
                withSonarQubeEnv('dwp-sonarqube-server-server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }   
}