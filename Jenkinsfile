pipeline {
  agent any
  stages {
    stage('Build images') {
      steps {
        script {
          docker.build("wp/stub","./docker/stub/")
          docker.build("wp/stub","./docker/db/")
        }
      }
    }
  }
}
