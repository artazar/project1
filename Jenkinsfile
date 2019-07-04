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
    stage('Test with vagrant') {
      steps {
        echo 'Running vagrant up'
        sh './tests/vagrant_it.sh'
        echo 'Cleaning up with vagrant destroy'
      }
    }
  }
}
