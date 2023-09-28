pipeline {
    agent any 
    tools {
        nodejs 'node'
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
                dir ("angularexp"){
                    sh "docker build -f dockerfile -t angularexp ."        
                }
            }
        }
        stage ("execute docker compose") {
            steps {
                dir ("angularexp"){
                    sh "docker compose up -d"        
                }
            }
        }
    }
}
