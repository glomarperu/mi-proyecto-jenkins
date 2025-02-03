pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "glomarperu/mi-proyecto-jenkins"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Clonar Repositorio') {
            steps {
                git branch: 'main', url: 'https://github.com/glomarperu/mi-proyecto-jenkins.git'
            }
        }
        
        stage('Lint') {
            steps {
                echo 'Ejecutando validación de sintaxis...'
                script {
                    // Usa el contenedor de Docker correctamente para ejecutar los pasos
                    docker.image('node:16').inside {
                        sh 'npm install -g htmlhint'  // Instalación global de htmlhint
                        sh 'htmlhint index.html'      // Ejecutar la validación de sintaxis
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Construyendo el proyecto...'
                // Aquí puedes agregar más pasos de construcción si es necesario
            }
        }

        stage('Pruebas') {
            steps {
                echo 'Ejecutando pruebas...'
                sh 'echo "Aquí puedes agregar pruebas unitarias"'
                // Puedes agregar un paso real de pruebas unitarias si lo tienes preparado
            }
        }

        stage('Construir Imagen Docker') {
            steps {
                echo 'Construyendo la imagen Docker...'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Publicar en Docker Hub') {
            steps {
                // Subir la imagen al Docker Hub con las credenciales configuradas en Jenkins
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }

        stage('Desplegar Contenedor') {
            steps {
                echo 'Desplegando la aplicación...'
                // Desplegar el contenedor con Docker en el puerto 8081
                sh 'docker run -d -p 8081:80 --name mi-app $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }
}
