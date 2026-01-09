pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "myapp:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/your-repo.git'
            }
        }

        stage('Build App') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, '.')
                }
            }
        }

        stage('Deploy with Docker-Compose') {
    steps {
        script {
            // Stop old containers (if running)
            sh 'docker-compose down'
            
            // Build and start containers in detached mode
            sh 'docker-compose up -d --build'
        }
    }
}


        stage('Run Docker Container') {
            steps {
                script {
                    // Stop old container if exists
                    sh "docker rm -f myapp_container || true"
                    // Run new container
                    sh "docker run -d --name myapp_container -p 8080:8080 ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Copy JAR to Container') {
    steps {
        sh 'docker cp target/my-app.jar myapp_container:/app/my-app.jar'
        sh 'docker restart myapp_container'
    }
}
  
        stage('Deploy with Docker-Compose (Optional)') {
            steps {
                script {
                    sh 'docker-compose down'
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully!"
        }
    }
}
