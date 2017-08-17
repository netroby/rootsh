pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh "sudo rsync --rsync-path='sudo rsync'  -avzP ./* /data/www/svc.ovh"
            }
        }
    }
}
