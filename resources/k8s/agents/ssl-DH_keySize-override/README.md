
## Requirement

```sh
kubectl create configmap override-java-security --from-file java.config
```

## Pipeline

```groovy
// Loading Shared Libraries
library identifier: 'my-shared-libraries@demo', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://github.com/carlosrodlop/my-jenkins-demos.git',
   credentialsId: '80ab8fca-fd75-479f-81ed-c769a9d07928'])

pipeline {
  agent {
    kubernetes {
       defaultContainer "maven"
       namespace "cje-support-general"
       yaml libraryResource("k8s/agents/ssl-DH_keySize-override/ssl_pod.yaml")
      }
  }
  stages {
    stage("Hello World") {
      steps {
        sh "mvn --version"
      }
    }
  }
}
```