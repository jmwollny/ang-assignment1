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
    stage('Tests') {
            agent {
                docker {
                    image 'ng-test-docker:latest'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'npm run-script test-headless'
            }
    }
    stage('Build') {
      steps { sh 'npm run-script build' }
    }
  }
}