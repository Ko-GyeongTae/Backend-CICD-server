pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Clone Repo"'
                
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
                sh(script: 'yarn start')
            }
        }
    }
}