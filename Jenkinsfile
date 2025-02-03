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
                    
                    // Construir imagen en ambas máquinas
                    sh 'docker build -t my-htmlhint-container .'
                    
                    // Intentar ejecutar el contenedor localmente en la máquina donde corra el pipeline
                    def isPortAvailable = sh(script: 'lsof -i :8081', returnStatus: true)
                    
                    if (isPortAvailable != 0) {
                        sh 'docker run -d -p 8081:80 my-htmlhint-container'
                        echo "Contenedor ejecutado en esta máquina"
                    } else {
                        echo "El puerto 8081 ya está en uso"
                    }
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
