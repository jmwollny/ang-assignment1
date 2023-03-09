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
    agent { label 'alpaca' }
    options { timestamps() }
    parameters {
        string(name: 'REV', defaultValue: 'release', description: 'Revision to build')
    }
    stages {
        stage('Checkout Code') {
            checkout(changelog: true, scm: [
                source: 'https://github.com/jmwollny/ang-assignment1',
                revision: params.REV
            ])
        }
        stage('Build service') {
            steps {
                script {
                    sh "docker build --pull --force-rm -t ng-test:latest ."
                }
            }
        }
    }
}