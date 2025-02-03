pipeline {
    agent any

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Instalar dependencias') {
            steps {
                script {
                    // Instalar globalmente htmlhint en el contenedor
                    sh 'docker run --rm node:16-alpine npm install -g htmlhint'
                }
            }
        }
        stage('Validar HTML') {
            steps {
                script {
                    // Usar un contenedor de Docker con la herramienta htmlhint instalada
                    sh 'docker run --rm -v $PWD:/workspace node:16-alpine htmlhint /workspace/index.html'
                }
            }
        }
        stage('Construir imagen Docker') {
            steps {
                script {
                    // Aquí va tu lógica para construir la imagen Docker
                    echo "Construir imagen Docker"
                }
            }
        }
        stage('Ejecutar pruebas') {
            steps {
                script {
                    // Aquí va tu lógica para ejecutar las pruebas
                    echo "Ejecutar pruebas"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completado.'
        }
        failure {
            echo 'Pipeline falló.'
        }
    }
}
