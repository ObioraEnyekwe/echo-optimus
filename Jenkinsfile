pipeline {
    agent any
    
    stages {
        stage('Set Execute Permission') {
            steps {
                sh 'chmod +x installation_files/terraform.sh'
            }
        }
        stage('Print Workspace Contents') {
            steps {
                sh 'ls -l $WORKSPACE'
            }
        }
        stage('Run Terraform Script') {
            steps {
                sh './installation_files/terraform.sh'
            }
        }
        stage('Set Execute Permission') {
            steps {
                sh 'chmod +x installation_files/terraform.sh'

            }
        }

        stage('Install AWS CLI') {
            steps {
                sh './installation_files/aws-cli.sh'
            }
        }
    }
}
