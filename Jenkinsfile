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
    stage('Test with docker-compose') {
      steps {
        echo 'Running docker-compose'
        sh 'docker-compose build'
        sh 'docker-compose up -d'
        sh './tests/service_integration_test.sh'
        sh 'docker-compose down'
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
