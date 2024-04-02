pipeline {
    agent {
        node {
            label 'maven_node_label'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
    }
    stages {
        // stage('git clone') {
        //     steps {
        //         git branch: 'branch_to_delete_and_never_merge', url: 'https://github.com/tchatua/tweet-trend-app.git'
        //     }
        // }
        stage("build") {
            steps {
                sh 'mvn clean deploy'
            }

        }
    }
}
