pipeline {
    agent any

    tools {
        nodejs "NodeJS 16.5.0"
    }

    stages {
        stage('Build') {
            steps {
                sh 'echo "Pull & Build Repo"'
                
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
}