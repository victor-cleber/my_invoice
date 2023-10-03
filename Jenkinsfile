pipeline {
    agent any

    stages {
        stage ('Build Image') {
            steps {
                script {
                    dockerapp = docker.build("victorcleber/my-invoice:${env.BUILD_ID}", '-f ./Dockerfile .') 
                }                
            }
        }
    }
}