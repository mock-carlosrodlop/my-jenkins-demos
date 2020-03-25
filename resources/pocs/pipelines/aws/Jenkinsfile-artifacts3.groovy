// resources/pocs/pipelines/aws/Jenkinsfile-withAWS.groovy
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
                def props = readJSON text: '{ "key": null, "a": "b" }', returnPojo: true
                writeJSON file: "output.json", json: input, pretty: 4
                archiveArtifacts "output.json"
            }
        }
    }
}