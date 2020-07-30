# Master CasC

## Steps

1. Get output from `$MASTER_URL/core-casc-export/`, separate yaml documents into diffrent files and place them into the same bundle
2. Edit files according to your needs (e.g. remove secrets) and validate them using http://www.yamllint.com/
3. Import bundle into OC `$JENKINS-HOME/jcasc-bundles-store` using the importer job  

```sh
SRC_BUNDLE="casc/bundle-2"
OC_JCASC_BUNDLE="$JENKINS_HOME/jcasc-bundles-store/carlosrodlop-bundle-2"
cp -R "$SRC_BUNDLE" "$OC_JCASC_BUNDLE"
```

4. Navigate to `$OC_URL/cjoc/core-casc-bundles` and check the Bundle has been imported correctly
5. In `$OC_URL/cjoc/core-casc-bundles` set Master/Team Path in the Operation Center JENKINS_HOME for the exiting or new Masters (e.g `/var/jenkins_home/jobs/Teams/jobs/team-example` => `Teams/team-example`)
6. Once you click on Save in the Manasged MAster/Team Proviosing configuration page the following lement are added to the YAML

```yaml
...
  containers:
      - env:
        - name: "ENVIRONMENT"
          value: "KUBERNETES"
        - name: "JAVA_OPTS"
          value: "... -Dcore.casc.config.bundle=/var/casc-bundle/bundle-link.yaml ..."
...
      volumeMounts:
        - mountPath: "/var/casc-bundle"
          name: "bundle-link-file"
...
      volumes:
      - name: "bundle-link-file"
        secret:
          secretName: "example-bundle-link"
```

7. (Optional) In the case the master is exiting a retsrat is required
8. Look at `kubectl log -f master-example-0` for troubleshooting once `Started container jenkins` is seen in the provisoing logs

```log
2020-06-19 17:34:55.632+0000 [id=25]	INFO	c.c.j.c.i.CJPPluginManager$StartUp$1#apply: Core Configuration as Code is enabled
2020-06-19 17:34:55.633+0000 [id=25]	INFO	c.c.j.c.i.CJPPluginManager$StartUp$1#apply: Using JCasC config: /var/jenkins_home/core-casc-bundle/jenkins.yaml
2020-06-19 17:35:00.036+0000 [id=25]	WARNING	c.c.j.c.i.ProfileSource#load: Plugin [release] from profile [com.cloudbees.jenkins.cjp.installmanager.ProfileSource$MultipleSource@80b40c6] not part of the envelope, ignoring
2020-06-19 17:35:00.036+0000 [id=25]	WARNING	c.c.j.c.i.ProfileSource#load: Plugin [esr-reporter] from profile [com.cloudbees.jenkins.cjp.installmanager.ProfileSource$MultipleSource@80b40c6] not part of the envelope, ignoring
...
2020-06-19 17:35:00.064+0000 [id=25]	INFO	c.c.j.c.i.CJPPluginManager$URLInstaller#install: Requested [INSTALL] of plugin [configuration-as-code] to version [1.40] completed
2020-06-19 17:35:00.065+0000 [id=25]	INFO	c.c.j.c.i.CJPPluginManager$URLInstaller#install: Requested [INSTALL] of plugin [workflow-durable-task-step] to version [2.35] completed
...
```

## Bundles

* bundle-1 - OK
* bundle-2 - KO

## Ref

* [Configuration as Code (CasC) for Masters | CloudBees Docs](https://docs.cloudbees.com/docs/cloudbees-core/latest/cloud-admin-guide/core-casc-modern)