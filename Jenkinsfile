pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Instalar dependencias') {
            steps {
                script {
                    // Usamos un contenedor Docker con Node.js para instalar dependencias
                    docker.image('node:16').inside {
                        sh 'npm install -g htmlhint'
                    }
                }
            }
        }
        stage('Validar HTML') {
            steps {
                script {
                    // Ejecutamos la validación en el contenedor Docker
                    docker.image('node:16').inside {
                        sh 'htmlhint index.html'
                    }
                }
            }
        }
        stage('Construir imagen Docker') {
            steps {
                script {
                    sh 'docker build -t glomarperu/mi-proyecto-jenkins:latest .'
                }
            }
        }
        stage('Ejecutar pruebas') {
            steps {
                echo 'Aquí puedes agregar pruebas unitarias.'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completado.'
        }
    }
}
