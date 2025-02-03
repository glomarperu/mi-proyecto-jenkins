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
                    // Instalar htmlhint dentro del contenedor personalizado
                    sh 'docker build -t my-htmlhint-container .'
                }
            }
        }
        stage('Validar HTML') {
            steps {
                script {
                    // Usar el contenedor personalizado para validar el HTML
                    sh 'docker run --rm -v $PWD:/workspace my-htmlhint-container htmlhint /workspace/index.html'
                }
            }
        }
        stage('Construir imagen Docker') {
            steps {
                script {
                    echo "Construir imagen Docker"
                }
            }
        }
        stage('Ejecutar pruebas') {
            steps {
                script {
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
