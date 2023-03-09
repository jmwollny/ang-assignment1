// pipeline {
//   agent {
//     docker { image 'node:latest' }    
//   }
//   stages {
//     stage('Install') {
//       steps { sh 'npm install' }
//     }
//     stage('Running ESLint') {
//         steps { sh 'npm run-script lint' }
//     }
//     stage('Tests') {
//         agent { dockerfile true }
//         steps {
//             sh 'npm run-script test-headless'
//         }
//     }
//   }
// }

pipeline {
    agent any
    options { timestamps() }
    stages {
        stage('Checkout Code') {
            steps {
                checkout(changelog: true, scm: [
                    source: 'https://github.com/jmwollny/ang-assignment1',
                    revision: params.REV
                ])
            }
        }
        stage('Build service') {
            steps {
                sh 'npm install && npm run test-headless'
            }
        }
        stage('Build container') {
            steps {
                script {
                    sh "docker build --pull --force-rm -t ng-test:latest ."
                }
            }
        }
    }
}