pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh 'docker build -t my-html-project .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker Container...'
                sh 'docker stop my-html-container || true'
                sh 'docker rm my-html-container || true'
                sh 'docker run -d -p 8081:8081 --name my-html-container my-html-project'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! Accessible at http://localhost:8080'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
