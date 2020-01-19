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

        stage('Deploy to kubertenes'){
            steps{
                sh "chmod +x changeTag.sh"
                sh "./changeTag.sh ${BUILD_NUMBER}"
                sshagent(['kops-machine']) {
                    sh "scp -o StrictHostKeyChecking=no services.yml my-app-pod.yml ec2-user@54.93.219.137:/home/ec2-user/"
                    script{
                        try{
                            sh "ssh ec2-user@54.93.219.137 kubectl apply -f ."
                        }catch(error){
                            sh "ssh ec2-user@54.93.219.137 kubectl create -f ."
                        }
                    }
                }
            }

        }

    }
}

