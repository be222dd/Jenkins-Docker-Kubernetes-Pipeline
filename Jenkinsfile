pipeline{
    agent any
    
    environment{
        DOCKER_TAG=getDockerTagFromGitCommitId()
    }

    tools{
        maven 'maven' 
        jdk 'java-8-openjdk' 
    }

    stages{
        stage('Compile the App'){
            steps{
                sh 'mvn package'
            }

        }

        stage('Build Docker Image'){
            steps{
                sh "docker build . -t be222dd/docker-sprint-boot:${DOCKER_TAG}"
            }
        }

        stage('Push to DockerHub'){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com','dockerHub'){
			            def customImage = docker.build("be222dd/docker-sprint-boot:${DOCKER_TAG}")
			            customImage.push()
	                }

                }
            }
        }

    }
}


def getDockerTagFromGitCommitId(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}