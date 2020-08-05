According to this [docs](https://jenkins.io/doc/book/managing/cli/), There are three basic modes in which the 2.54+ / 2.46.2+ client may be used, selectable by global option: -http; -ssh; and -remoting.

**Requirements**:

- CLI version should be 2.54 or above
- Add ssh public key added to logged user --> $JENKINS_URL/me/configure
- Jenkins Global Security 1.- TCP port for JNLP agents 2.- TCP CLI protocols 1 and 2 are activated

# 1.- `-http`

java -jar jenkins-cli.jar -s `<JENKINS_URL>` -auth `<USER>:<API_TOKEN>` `<COMMAND>`

## Run Groovy Script

```sh
> java -jar jenkins-cli.jar -s http://127.0.0.1:9191/ -auth admin:12a269a2d9235306f22430c383f34b48 groovy = < test.groovy
```

# 2.- `-ssh`


java -jar jenkins-cli.jar -s `<JENKINS_URL>` -ssh -user `<USER>`  `<COMMAND>`

**Requirement**: you need to enable SSH Server under. If NOT

```
<TIMESTAMP> hudson.cli.SSHCLI sshConnection
WARNING: No header 'X-SSH-Endpoint' returned by Jenkins
```

## Run Groovy Script

```sh
> java -jar jenkins-cli.jar -s http://127.0.0.1:9191 -ssh -user admin groovy = < test.groovy
```


# 3.- `-remoting` (NOT RECOMMENDED)

java -jar jenkins-cli.jar  -remoting -s `<JENKINS_URL>` `<COMMAND>` --username <USER> --password <PASS>

**Requirement**: You need to enable CLI is enabled over Remoting (NOT RECOMMENDED). Otherwise:

```
java.io.EOFException
...
    Suppressed: java.io.IOException: Server returned HTTP response code: 403 for URL: <JENKINS_URL>/cli?remoting=true
        ...
```

## Run Groovy Script

```sh
java -jar jenkins-cli.jar  -remoting -s http://127.0.0.1:9191/ groovy test.groovy --username admin --password admin
```

## Help (before CLI 2.54+ / 2.46.2+)

```sh
#java -jar jenkins-cli.jar [-s JENKINS_URL] [-i PRIVATE_KEY] command [options...] [arguments...]
java -jar jenkins-cli.jar -s http://localhost:8182/ help --username harryh --password harryh
```

## Create groups (before CLI 2.54+ / 2.46.2+)

<http://localhost:8182/cli/command/create-group>

```sh
#java -jar jenkins-cli.jar -s JENKINS_SERVER/ create-group CONTAINER GROUP --username USERNAME --password PASSWORD
java -jar jenkins-cli.jar -s http://localhost:8182/ create-group root groupByCli --username harryh --password harryh
```

## Crete a new view (before CLI 2.54+ / 2.46.2+)

```sh
# Creates a new view by reading stdin as a XML configuration. --> Enter xml by < file.xml
java -jar jenkins-cli.jar -s http://localhost:8080/ create-view new_view < view.xml
```

## Create a job (before CLI 2.54+ / 2.46.2+)

Job/Create is needed. As a prerequisite for the below example, to create folder4 item, folder3 needs to be created beforehand

```sh
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ create-job folder3/folder4 --username admin --password admin  < 006-folder-creator.xml
```

## Update parameter (before CLI 2.54+ / 2.46.2+)

```sh
java -jar /Users/carlosrodlop/Downloads/jenkins-cli.jar -s http://localhost:8080/ -noKeyAuth set-build-parameter PARAMETER updateValue
java -jar /Users/carlosrodlop/Downloads/jenkins-cli.jar -s http://localhost:8080/ -noKeyAuth set-build-parameter PARAMETER updateValue --username admin --password admin
java -jar /Users/carlosrodlop/Downloads/jenkins-cli.jar -s http://localhost:8080/job/freestyle_test/5/ -noKeyAuth set-build-parameter PARAMETER updateValue --username admin --password admin
java -jar /Users/carlosrodlop/Downloads/jenkins-cli.jar -s http://localhost:8080/ -noKeyAuth set-build-parameter PARAMETER2 updateValue2 --username admin --password admin
```

## Build a job (before CLI 2.54+ / 2.46.2+)

```sh
#java -jar jenkins-cli.jar -s $JENKINS_URL build $JOBNAME --username $USERID --password $PASS
java -jar jenkins-cli.jar -s http://labs.cje.linux.crl:8183/ build backup_ZD35395_ex --username admin --password admin
```

### Build a paremetrized job (before CLI 2.54+ / 2.46.2+)

```sh
java -jar jenkins-cli.jar -s http://localhost:8080/ build zd36582 --username admin --password admin -p PARAMATER1=new1 -p PARAMATER2=new2
```
