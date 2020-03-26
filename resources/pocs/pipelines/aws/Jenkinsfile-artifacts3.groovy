// resources/pocs/pipelines/aws/Jenkinsfile-artifacts3.groovy
def props 
pipeline {
    agent {
        kubernetes {
          containerTemplate {
            name 'aws-cli'
            image 'carlosrodlop/jenkins-slave-aws:e7c3999'
            ttyEnabled true
            }
        }
    }
    stages {
        stage('archiving into AWS s3') {
            steps {
                script {
                    props = readJSON text: '{ "DSE": "crodriguezlopez", "Title": "Lead" }', returnPojo: true
                    sh "touch empty.txt"
                }
                writeJSON file: "output.json", json: props, pretty: 4
                archiveArtifacts artifacts: "*.*", fingerprint: true
            }
        }
    }
}