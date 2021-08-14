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
                                    sourceFiles: "dist/, package.json",
                                    remoteDirectory: "jenkins/cicd/",
                                    execCommand: "\n
                                        cd ~/jenkins/cicd\n
                                        yarn\n
                                        pm2 start yarn --interpreter bash --name CI/CD-server -- start\n
                                        exit 0\n
                                    ",
                                    execTimeout: 60000,
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