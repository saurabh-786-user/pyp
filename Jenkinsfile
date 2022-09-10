pipeline {
    agent any
    stages {
        stage('Installing Dependencies') {
            // when {
            //     branch 'main'
            // }
            steps {
                sh '''
                sudo apt update
                sudo apt install software-properties-common -y
                sudo add-apt-repository ppa:deadsnakes/ppa -y
                sudo apt install python3.7 -y
                sudo apt install python3-pip -y
                sudo apt remove docker docker-engine docker.io containerd runc -y
                sudo apt update
                sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
                sudo mkdir -p /etc/apt/keyrings
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                echo \\
                "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \\
                $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                sudo apt update -y
                sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
                sudo systemctl enable docker
                sudo systemctl start docker
                '''
            }
        }
        // Jenkins Stage to Build the Docker Image
        stage('Build Image') {
            // when {
            //     branch 'main'
            // }
            steps {
            sh "sudo docker build -t shubhamborkar/myapp:v-1.0 ."
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
            cat password.txt | docker login --username shubhamborkar --password-stdin
            sudo docker push shubhamborkar/myapp:v1.0
            '''
            }

        }
    }
}