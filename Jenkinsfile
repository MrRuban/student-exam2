pipeline {
    
    environment {
        name = 'matveyruban/exam:web_app'
        credential = 'docker_hub'
        dockerImage = ''
    }
    
    agent any
    
    stages {
        stage ('Cloning our Git') {
            steps {
                git 'https://github.com/MrRuban/student-exam2'
            }
        }
        stage ('Start python test') {
            steps {
                sh '''
                cd ~/build/workspace/CI_web_app
                python3 -m venv venv
                . venv/bin/activate
                pip install -e .
                export FLASK_APP=js_example
                pip install -e '.[test]'
                coverage run -m pytest
                coverage report
                 '''
            }
        }
        stage ('Build docker image') {
            steps {
                script {
                    dockerImage = docker.build name
                }
            }
        }
        stage ('Auth and push in  docker hub') {
            steps {
                script {
                    docker.withRegistry( '', credential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage ('Cleaning up') {
            steps {
                sh "docker rmi $name"
            }
        }
    }
}
