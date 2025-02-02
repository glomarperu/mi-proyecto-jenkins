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
                // Aquí puedes agregar cualquier paso de construcción si fuera necesario
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Desplegando la vista HTML'
                // Si tienes un servidor para desplegar, puedes agregar los comandos aquí
            }
        }
    }
}
