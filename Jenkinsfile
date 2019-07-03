pipeline {
  agent any
  stages {
    stage('Build image for stub ct') {
      steps {
        script {
          docker.build("wp/stub","./docker/stub/")
        }
      }
    }
  }
}
