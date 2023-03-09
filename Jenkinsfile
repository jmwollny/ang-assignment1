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
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [
                        [$class: 'CleanBeforeCheckout'], 
                        [$class: 'RelativeTargetDirectory', relativeTargetDir: 'targetDir']
                    ], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [
                        [
                            credentialsId: 'jenkinsserviceaccount',
                            url: 'https://github.com/jmwollny/ang-assignment1.git'
                        ]
                    ]
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