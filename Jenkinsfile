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
    // stage('Unit tests') {
    //     steps { sh 'npm run-script test-headless' }
    // }
    stage('Build') {
      steps { sh 'npm run-script build' }
    }
  }
}