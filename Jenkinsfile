pipeline {
    agent any
    stages {
        // Jenkins Stage to Build the Docker Image
        stage('Build Image') {
            // when {
            //     branch 'main'
            // }
            steps {
            sh "sudo docker build -t saurabhkaremore/myapp:v1.1 ."
            }
        }

        // Jenkins Stage to Publish the Docker Image.
        stage('Publish Image') {
            // when {
            //     branch 'main'
            // }
            steps {
            sh '''
            sudo chmod 666 /var/run/docker.sock
            cat password.txt | docker login --username saurabhkaremore --password-stdin
            sudo docker push saurabhkaremore/myapp:v1.1
            '''
            }

        }
    }
}