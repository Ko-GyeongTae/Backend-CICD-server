pipeline {
    agent any

    tools {
        nodejs "NodeJS 16.5.0"
    }

    environment {
        SLACK_CHANNEL = '# cicd-테스트'
    }

    stages {
        stage('Build') {
            steps {
                sh 'echo "Pull & Build Repo"'
                slackSend (channel: SLACK_CHANNEL, color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

                sh(script: 'yarn')
                sh(script: 'yarn build')
                
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Test Code"'
                sh(script: 'yarn test')
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Connect SSH & Deploy"'
                sshPublisher(
                    continueOnError: false, 
                    failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "T3100",
                            transfers: [
                                sshTransfer(
                                    sourceFiles: ""
                                    remoteDirectory: "/jenkins/Backend-CICD-server"
                                    execCommand: "cd ~/jenkins/Backend-CICD-server && git pull && docker rm -f cicd-server && docker build --tag cicd-server . && docker run -d --name cicd-server -p 5555:5555 cicd-server && exit 0",
                                    execTimeout: 300000,
                                )
                            ],
                            verbose: true
                        )
                    ]
                )
            }
        }
    }
    post {
        success {
            slackSend (channel: SLACK_CHANNEL, color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
            slackSend (channel: SLACK_CHANNEL, color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}