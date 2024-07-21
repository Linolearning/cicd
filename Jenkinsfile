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
                sh '''
                    cd databricks-terraform
                    echo "init completed successfully"
                    terraform init
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
               sh '''
                    echo "plan completed successfully"
                    terraform plan
                '''
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
