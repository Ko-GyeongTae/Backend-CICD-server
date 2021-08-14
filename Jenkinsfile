pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "Clone Repo"'
                git(
                    url: 'https://github.com/Ko-GyeongTae/Backend-CICD-server.git',
                    credentialsId: 'kokt0203',
                    branch: 'main'
                )
                /*
                sh 'npm i -g yarn'
                sh 'yarn'
                sh 'yarn build'
                */
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Test Code"'
                //sh 'yarn test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploy Code"'
                //sh 'yarn start'
            }
        }
    }
}