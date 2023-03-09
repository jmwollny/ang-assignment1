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
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:current-alpine3.12'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'npm run test-headless'
            }
        }
    }
}

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
        // stage('Build service') {
        //     steps {
        //         sh 'npm install && npm run test-headless'
        //     }
        // }
        stage('Build test container') {
            agent { 
                dockerfile {
                    filename 'cc-tests.Dockerfile'
                }
            }
            steps {
                script {
                    sh "npm run test-headless"
                }
            }
        }
    }
}