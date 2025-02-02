pipeline {
    agent any
    
    stages {
        stage('Clonar Repositorio') {
            steps {
                git branch: 'main', url: 'https://github.com/glomarperu/mi-proyecto-jenkins.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Construyendo el proyecto...'
                
                // Construir la imagen Docker
                sh 'docker build -t mi-proyecto .'
                
                // Ejecutar el contenedor Docker y mapear el puerto 8081
                sh 'docker run -d -p 8081:80 mi-proyecto'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Desplegando la vista HTML'

                // Aquí podrías agregar cualquier otro paso de despliegue, como
                // detener el contenedor si ya está corriendo y volver a iniciarlo
                sh 'docker ps -q --filter "name=mi-proyecto" | xargs -r docker stop && docker rm'
                sh 'docker run -d -p 8081:80 mi-proyecto'
                
                // Si quieres probar si el proyecto se desplegó correctamente, puedes agregar un paso para hacerlo
                // como un curl o wget para hacer una solicitud HTTP
                sh 'curl http://localhost:8081'
            }
        }
    }
}
