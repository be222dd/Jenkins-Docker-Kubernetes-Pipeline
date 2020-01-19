pipeline{
    agent any
    

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

        stage('Push to DockerHub'){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com','dockerHub'){
			            
                        def customImage = docker.build("be222dd/docker-sprint-boot:${BUILD_NUMBER}")
			            customImage.push()
	                }

                }
            }
        }

    }
}

