pipeline {
    agent any

    tools {
        nodejs "Node 22.x"
    }

    stages {
        stage('Install') {
            steps {
                sh 'npm install'
                currentBuild.description = "Aww, yeah."
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
                currentBuild.description = "Glad I put this tape in."
            }
        }
    }
}
