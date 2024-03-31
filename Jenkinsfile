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
        // stage('clone-code') {
        //     steps {
        //         git branch: 'develop', url: 'https://github.com/tchatua/e01_micro-services-admin.git'
        //     }
        // }
        stage ("build") {
            steps {
                sh 'mvn clean deploy'
            }


        }
    }
}