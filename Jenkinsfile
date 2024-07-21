pipeline {
    agent any
    environment {
        DATABRICKS_TOKEN = credentials('databricks-token')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Linolearning/cicd.git'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'cd databricks-terraform'
                    sh 'terraform init'
                    sh 'echo "completed successfully"'
                    sh 'pwd'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'pwd'
                    sh 'cd databricks-terraform'
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
