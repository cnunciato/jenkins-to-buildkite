pipeline {
    agent any

    tools {
        nodejs "Node 22.x"
    }

    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
            post {
                always {
                  currentBuild.description = "Aww, yeah."
                }
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
            post {
                always {
                  currentBuild.description = "Glad I put this tape in."
                }
            }
        }
    }
}
