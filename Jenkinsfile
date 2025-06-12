pipeline {
    agent any

    tools {
        nodejs "Node 22.x"
    }

    options {
        ansiColor('xterm')
    }

    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
    }
}
