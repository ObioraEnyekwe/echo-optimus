pipeline {
    agent any
    
    stages {

        stage('Run Terraform Script') {
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
