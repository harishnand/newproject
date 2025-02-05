pipeline {
    agent any

    environment {
<<<<<<< HEAD
        REPO_NAME = "flitemax/nginxdemo"
        IMAGE_TAG = "latest"
        CHAT_ID = "-4689567738"
=======
        CHAT_ID = "-4689567738"  // Replace with actual group or user ID
>>>>>>> f2c8be2 (Updated Telegram notification with full commit details)
        BOT_TOKEN = "7734420703:AAEUADW5FrL5ZrgumPFd-nWkMnnmFGdEKJ0"
    }

    stages {
        stage('Checkout Code') {
            steps {
<<<<<<< HEAD
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
=======
                script {
                    checkout scm

                    // Get Git details
                    GIT_BRANCH = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
                    COMMIT_ID = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    COMMIT_MSG = sh(script: "git log -1 --pretty=format:'%s - %b'", returnStdout: true).trim()
                    COMMIT_AUTHOR = sh(script: "git log -1 --pretty=format:'%an'", returnStdout: true).trim()
>>>>>>> f2c8be2 (Updated Telegram notification with full commit details)
                }
            }
        }

        stage('Build and Deploy') {
            steps {
<<<<<<< HEAD
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SERVER_IP} << 'EOF'
                        cd /home/ubuntu/newproject
                        docker-compose down
                        docker-compose pull
                        docker-compose up -d --force-recreate
                        exit
                        EOF
                    """
=======
                script {
                    echo "Building application..."
                    sleep(5)
                    echo "Deployment completed!"
>>>>>>> f2c8be2 (Updated Telegram notification with full commit details)
                }
            }
        }

        stage('Send Telegram Notification') {
            steps {
                script {
                    def message = """Hi, Jenkins job: ${JOB_NAME} status is SUCCESS
env: ${GIT_BRANCH}
Committed by: ${COMMIT_AUTHOR}
commit-id: ${COMMIT_ID}
commit msg: ${COMMIT_MSG}"""

                    sh """
                        curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \\
                        -d chat_id=${CHAT_ID} \\
<<<<<<< HEAD
                        -d text="✅ Deployment Successful on branch: main"
=======
                        -d text="${message}"
>>>>>>> f2c8be2 (Updated Telegram notification with full commit details)
                    """
                }
            }
        }
    }
}
