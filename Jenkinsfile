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
                                sshTransfer(execCommand: "
                                    cd ~/Backend_Infowargame_v2 
                                    git pull 
                                    yarn 
                                    yarn build 
                                    pm2 start yarn --interpreter bash --name CI/CD-server -- start 
                                    exit
                                "),
                            ],
                            verbose: true
                        )
                    ]
                )
            }
        }
    }
}