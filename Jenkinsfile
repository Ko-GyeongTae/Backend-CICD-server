node {
    agent any
    stage('CI') {
        steps('Pull') {
            echo 'Pulling Repository from github'
            checkout scm
        }
        steps('Build') {
            echo 'Building Repository'
        }
        steps('Test') {
            echo 'Testing Repository'
        }
    }
    stage('CD') {
        steps('Pull') {
            echo 'Pulling Repository from CI stage'
        }
        steps('PreDeploy') {
            echo 'Preparing Repository directory'
        }
        steps('Deploy') {
            echo 'Deploying Repository'
        }
    }
}