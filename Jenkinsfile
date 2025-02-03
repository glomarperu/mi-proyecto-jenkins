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
                    
                    // Verificar si el puerto 8081 está en uso y detener el contenedor que lo esté utilizando
                    def isPortAvailable = sh(script: 'lsof -i :8081', returnStatus: true)
                    
                    if (isPortAvailable == 0) {
                        // Si el puerto está en uso, obtener el ID del contenedor y detenerlo
                        def containerId = sh(script: 'lsof -ti :8081', returnStdout: true).trim()
                        sh "docker stop ${containerId}"
                        sh "docker rm ${containerId}"
                        echo "Contenedor detenido y eliminado."
                    }
                    
                    // Ejecutar el contenedor nuevo
                    sh 'docker run -d -p 8081:80 my-htmlhint-container'
                    echo "Contenedor ejecutado en esta máquina en el puerto 8081"
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
