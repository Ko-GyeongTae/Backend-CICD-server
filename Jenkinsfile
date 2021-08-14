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
                sh 'echo "Deploy Code"'
                sshagent(credentials: 'T3100') {
                    sh 'echo "Connect SSH"'
                    sh 'cd ~/Backend_Infowargame_v2'

                    sh 'echo "Pull & Build"'
                    sh 'git pull'
                    sh (script: 'yarn')
                    sh (script: 'yarn build')

                    sh 'echo "Deploy"'
                    sh (script: 'pm2 start yarn --interpreter bash --name CI/CD-server -- start')
                }
            }
        }
    }
}