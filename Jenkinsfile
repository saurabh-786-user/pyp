#!/usr/bin/env groovy
pipeline {
    agent {
        node any
    }

    stages {
        stage('Installing Dependencies') {
            when {
                branch 'main'
            }
            steps {
                sh "dependencies.sh"
            }
        }
        // Jenkins Stage to Build the Docker Image
        stage('Build Image') {
            when {
                branch 'main'
            }
            sh "sudo docker build -t shubhamborkar/myapp:v-1.0 ."
        }

        stage('Publish Image') {
            when {
                branch 'main'
            }
            sh '''
            sudo chmod 666 /var/run/docker.sock
            cat password.txt | docker login --username shubhamborkar --password-stdin
            sudo docker push shubhamborkar/myapp:v1.0
            '''

            
            // Jenkins Stage to Publish the Docker Image to Dockerhub or any Docker repository of your choice.

        }
    }
}