pipeline {
  agent {
    docker { image 'node:latest' }    
  }
  stages {
    stage('Install') {
      steps { sh 'npm install' }
    }
    stage('Running ESLint') {
        steps { sh 'npm run-script lint' }
    }
    stage('Tests') {
        agent { dockerfile true }
        steps {
            sh 'npm run-script test-headless'
        }
    }
  }
}