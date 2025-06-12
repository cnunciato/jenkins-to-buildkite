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
                    script {
                        currentBuild.description = "Aww, yeah."
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
            post {
                always {
                    script {
                        currentBuild.description = "Glad I put this tape in."
                    }
                }
            }
        }
    }
}
