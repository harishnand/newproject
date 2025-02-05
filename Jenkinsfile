pipeline {
    agent any

    environment {
        CHAT_ID = "-4689567738"  // Replace with actual group or user ID
        BOT_TOKEN = "7734420703:AAEUADW5FrL5ZrgumPFd-nWkMnnmFGdEKJ0"
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    checkout scm

                    // Get Git details
                    GIT_BRANCH = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
                    COMMIT_ID = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    COMMIT_MSG = sh(script: "git log -1 --pretty=format:'%s - %b'", returnStdout: true).trim()
                    COMMIT_AUTHOR = sh(script: "git log -1 --pretty=format:'%an'", returnStdout: true).trim()
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    echo "Building application..."
                    sleep(5)
                    echo "Deployment completed!"
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
                        -d text="${message}"
                    """
                }
            }
        }
    }
}
