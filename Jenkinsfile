pipline {
    stages('CI') {
        stage('Pull') {
            echo 'Pulling Repository from github'
            
        }
        stage('Build') {
            echo 'Building Repository'
        }
        stage('Test') {
            echo 'Testing Repository'
        }
    }
    stages('CD') {
        stage('Pull') {
            echo 'Pulling Repository from CI stage'
        }
        stage('PreDeploy') {
            echo 'Preparing Repository directory'
        }
        stage('Deploy') {
            echo 'Deploying Repository'
        }
    }
}