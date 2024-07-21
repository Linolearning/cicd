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
                    terraform init
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
               sh '''
                    cd databricks-terraform
                    terraform plan
                '''
            }
        }
    
        stage('Terraform Apply') {
            when {
                expression {
                    def userInput = input(
                        id: 'Proceed2', message: 'Final Approval to Apply?', parameters: [
                        [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Approve to apply', name: 'ProceedApply']
                    ])
                    return userInput
                }
            }
            steps {
                    sh 'terraform apply '
            }
}
}
