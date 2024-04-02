pipeline {
    agent {
        node {
            label 'maven_node_label'
        }
    }
    stages {
        stage('git clone') {
            steps {
                git branch: 'branch_to_delete_and_never_merge', url: 'https://github.com/tchatua/tweet-trend-app.git'
            }
        }
    }
}
