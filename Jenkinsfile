pipeline {
    agent any
    
    stages {
        stage('Install Terraform') {
            steps {
                sh './installation_files/terraform.sh'
            }
        }
        stage('Install AWS CLI') {
            steps {
                sh './installation_files/aws-cli.sh'
            }
        }         
    }
}
