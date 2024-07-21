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
        stage('Approval') {
            steps {
                script {
                    def userInput = input(
                        id: 'Proceed1', message: 'Approve or Abort?', parameters: [
                        [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Approve to proceed', name: 'Proceed']
                    ])
                    if (userInput) {
                        echo "User approved"
                    } else {
                        error "Aborted by user"
                    }
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
