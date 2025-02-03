pipeline {
    agent any
    
    environment {
        // Puedes añadir otras variables de entorno si las necesitas
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Instalar dependencias') {
            steps {
                script {
                    // Instalación de htmlhint dentro del contenedor Docker
                    sh 'npm install -g htmlhint'
                }
            }
        }
        
        stage('Validar HTML') {
            steps {
                script {
                    // Ejecuta el comando de validación con htmlhint
                    sh 'htmlhint index.html'
                }
            }
        }

        stage('Construir imagen Docker') {
            steps {
                script {
                    // Aquí puedes añadir el paso para construir tu imagen Docker
                    sh 'docker build -t mi-imagen .'
                }
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                script {
                    // Aquí puedes añadir las pruebas que desees ejecutar
                    sh 'npm test'
                }
            }
        }
    }

    post {
        always {
            // Limpiar o realizar acciones post-ejecución
            echo 'Pipeline completado.'
        }
        failure {
            echo 'Pipeline falló.'
        }
    }
}
