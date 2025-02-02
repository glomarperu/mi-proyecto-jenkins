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
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Desplegando la vista HTML'                
            }
        }
    }
}
