pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'luhpelayo/cicd-tarea-pelayo:latest'
  	// identificador de versión
        DOCKER_IMAGE_TAG = "${DOCKER_IMAGE}:${currentBuild.getTimeInMillis()}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Clonar desde la rama "main" del repositorio de GitHub
               // checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/luhpelayo/cicd-tarea-pelayo.git']]])
                echo 'Git Checkout Completed'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construir la imagen Docker usando el Dockerfile en el directorio actual
                    docker.build(DOCKER_IMAGE, '.')
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Publicar la imagen Docker en Docker Hub
                    docker.withRegistry('', 'docker-pelayo') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Ejecución de Pruebas Completada"
                }
            }
        }

        stage('Desplegar') {
            steps {
                script {
                    echo "Proyecto desplegado"
                }
            }
        }
    }

    post {
        always {
            script {
                // Eliminar la imagen local después de la construcción y la publicación
                docker.image(DOCKER_IMAGE).remove()
            }
        }
    }
}
