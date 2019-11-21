pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any

    tools {
        maven 'maven_3.0.5'
    }

    stages {
        stage('Code Compilation') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
           steps {
                sh 'docker build -t newpipeline .'
           }
         }

        stage('Upload Docker Image to AWS ECR') {
            steps {
			   script {
			      withDockerRegistry([credentialsId:'ecr:ap-south-1:ecr-credentials', url:"https://306870229847.dkr.ecr.ap-south-1.amazonaws.com"]){
                  sh """
				  echo "Tagging the Docker Image: In Progress"
				  docker tag pipeline:latest 306870229847.dkr.ecr.ap-south-1.amazonaws.com/newpipeline:$TAG
				  echo "Tagging the Docker Image: Completed"
				  echo "Push Docker Image to ECR : In Progress"
				  docker push 306870229847.dkr.ecr.ap-south-1.amazonaws.com/newpipeline:latest
				  echo "Push Docker Image to ECR : Completed"
				  """
				  }
                }
            }
		}
        stage('Deploy to Production') {
            steps {
                sh 'date'
            }
        }

    }
}