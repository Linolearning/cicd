pipeline {
    agent any
    environment {
        DATABRICKS_TOKEN = credentials('databricks-token')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Linolearning/cicd.git'
            }
        }
        stage('Terraform Init') {
            steps {
                dir('databricks-terraform') 
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }
        // stage('Terraform Apply') {
        //     steps {
        //         script {
        //             sh 'terraform apply -auto-approve'
        //         }
        //     }
        // }
    }
}
