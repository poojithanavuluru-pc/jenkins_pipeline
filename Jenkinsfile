pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "myapp:${env.BUILD_NUMBER}"
        NEXUS_REPO = "your-nexus-repo-url/repository/maven-releases/"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/your-repo.git'
            }
        }

        stage('Build App') {
            steps {
                // For Maven project
                sh 'mvn clean package'
            }
        }

        stage('Push to Nexus') {
            steps {
                // Only if you want to push artifacts
                sh 'mvn deploy -DaltDeploymentRepository=nexus::default::${NEXUS_REPO}'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, '.')
                }
            }
        }
    }

    post {
        success {
            echo "Docker image ${DOCKER_IMAGE} built successfully"
        }
    }
}

