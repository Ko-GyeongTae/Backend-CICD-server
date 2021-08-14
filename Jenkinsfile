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
                                    sourceFiles: "**",
                                    remoteDirectory: "node_modules/",
                                    execCommand: "cd ~/jenkins/cicd && yarn && pm2 start yarn --interpreter bash --name CI/CD-server -- start && exit 0",
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