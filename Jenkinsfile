pipeline {
    agent any

    environment {
        REPO_NAME = "flitemax/nginxdemo"
        IMAGE_TAG = "latest"
        CHAT_ID = "@vijaysamuel"
        BOT_TOKEN = "7734420703:AAEUADW5FrL5ZrgumPFd-nWkMnnmFGdEKJ0"
        SERVER_IP = "176.34.98.123"
        SSH_USER = 'ubuntu'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main' , url: 'https://github.com/harishnand/newproject.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${REPO_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerHub', url: 'https://index.docker.io/v1/']) {
                    sh "docker push ${REPO_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SERVER_IP} <<EOF
                        cd /home/ubuntu/app
                        docker-compose down
                        docker-compose pull
                        docker-compose up -d --force-recreate
                        EOF
                    """
                }
            }
        }

        stage('Send Telegram Notification') {
            steps {
                script {
                    sh """
                        curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \\
                        -d chat_id=${CHAT_ID} \\
                        -d text="✅ Deployment Successful on branch: ${env.BRANCH_NAME}"
                    """
                }
            }
        }
    }
}
