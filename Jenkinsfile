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
                sh(script: 'pm2 start yarn --interpreter bash --name CiCd-Test -- start')
            }
        }
    }
}