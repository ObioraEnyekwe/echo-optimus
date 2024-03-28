pipeline {
    agent any
    
    stages {
        stage('Set Execute Permission Terr') {
            steps {
                sh 'chmod +x installation_files/terraform.sh'
            }
        }
        stage('Run Terraform Script') {
            steps {
                sh './installation_files/terraform.sh'
            }
        }
        stage('Set Execute Permission AWS') {
            steps {
                sh 'chmod +x installation_files/aws-cli.sh'

            }
        }

        stage('Install AWS CLI') {
            steps {
                sh './installation_files/aws-cli.sh'
            }
        }
    }
}
