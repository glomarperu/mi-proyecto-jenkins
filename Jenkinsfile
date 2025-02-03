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
                    // Ejecuta la instalación dentro del contenedor Docker
                    sh 'docker run --rm node:16-alpine npm install -g htmlhint'
                }
            }
        }


        stage('Validar HTML') {
            steps {
                script {
                    // Usamos la misma imagen Docker para ejecutar la validación HTML
                    docker.image('node:16-alpine').inside {
                        // Ejecuta el comando de validación con htmlhint
                        sh 'htmlhint index.html'
                    }
                }
            }
        }

        stage('Construir imagen Docker') {
            steps {
                script {
                    // Construir la imagen Docker para tu aplicación
                    sh 'docker build -t mi-imagen .'
                }
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                script {
                    // Ejecuta pruebas dentro del contenedor Docker con Node.js
                    docker.image('node:16-alpine').inside {
                        sh 'npm test'
                    }
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
