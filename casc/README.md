# Master CasC

## Steps

1. Get output from `$MASTER_URL/core-casc-export/`, separate yaml documents into diffrent files and place them into the same bundle
2. Edit files according to your needs (e.g. remove secrets) and validate them using http://www.yamllint.com/
3. Import bundle into OC `$JENKINS-HOME/jcasc-bundles-store` using the importer job 

```sh
SRC_BUNDLE="casc/bundle-1"
OC_JCASC_BUNDLE="$JENKINS_HOME/jcasc-bundles-store/carlosrodlop-bundle-1"
if [ ! -d "$OC_JCASC_BUNDLE" ]; then
  mkdir -p "$OC_JCASC_BUNDLE"
fi
cp "$SRC_BUNDLE/bundle.yaml" "$OC_JCASC_BUNDLE/bundle.yaml"
cp "$SRC_BUNDLE/jenkins.yaml" "$OC_JCASC_BUNDLE/jenkins.yaml"
cp "$SRC_BUNDLE/plugins.yaml" "$OC_JCASC_BUNDLE/plugins.yaml"
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
8. Look at `kubectl log -f master-example-0` for troubleshooting

```log
2020-06-19 17:26:54.153+0000 [id=26]	WARNING	c.c.j.c.i.casc.HttpLoader#load: Invalid configuration bundle: Missing 'apiVersion' property in bundle.yaml. Using the existing one
2020-06-19 17:26:54.163+0000 [id=26]	INFO	c.c.j.c.i.CJPPluginManager$StartUp$1#apply: Core Configuration as Code is enabled
```


## Ref

* [Configuration as Code (CasC) for Masters | CloudBees Docs](https://docs.cloudbees.com/docs/cloudbees-core/latest/cloud-admin-guide/core-casc-modern)