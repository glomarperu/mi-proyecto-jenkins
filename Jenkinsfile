pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio
                checkout scm
            }
        }
        stage('Instalar dependencias') {
            steps {
                // Instalar htmlhint para la validación de sintaxis HTML
                script {
                    sh 'npm install -g htmlhint'
                }
            }
        }
        stage('Validar HTML') {
            steps {
                // Ejecutar la validación de HTML
                script {
                    sh 'htmlhint index.html'
                }
            }
        }
        stage('Construir imagen Docker') {
            steps {
                // Construir la imagen Docker usando el Dockerfile
                script {
                    sh 'docker build -t glomarperu/mi-proyecto-jenkins:latest .'
                }
            }
        }
        stage('Ejecutar pruebas') {
            steps {
                // Agregar tus pruebas unitarias aquí si las tienes
                echo 'Aquí puedes agregar pruebas unitarias.'
            }
        }
    }

    post {
        always {
            // Aquí puedes agregar cualquier limpieza o notificación
            echo 'Pipeline completado.'
        }
    }
}
