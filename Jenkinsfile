pipeline {
    agent any 
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage ("Clean") {
            steps {
                deleteDir()
            }
        }
        stage ("Clone Repo") {
            steps {
                sh "git clone https://github.com/MaBouz/angularexp.git"
            }
        }
        stage ("Generate Docker image") {
            steps {
                dir ("frontend"){
                    sh "docker build -f dockerfile.txt -t malbouz/angularexp:1.1.${env.BUILD_NUMBER} ."        
                }
            }
        }
        stage ("push ocker image") {
            steps {
                    sh "docker push malbouz/angularexp:1.1.${env.BUILD_NUMBER}"        
            }
        }
    }
}
