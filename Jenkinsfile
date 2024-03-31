pipeline {
    agent {
        node {
            label 'maven-label'
        }
    }

    stages {
        stage('git clone') {
            steps {
                git branch: 'develop', url: 'https://github.com/tchatua/e01_micro-services-admin.git'
            }
        }
    }
}