# Steps

1. Get output from https://core.gcp.support.beescloud.com/teams-dse-team-emea/core-casc-export/
2. Separate yaml documents into diffrent files and place them into the same bundle
3. Edit `jenkins.yaml`: mask secrets, etc.
4. Import bundle into OC `$JENKINS-HOME/jcasc-bundles-store` using `importer-config.xml`
5. Navigate to `$OC_URL/cjoc/core-casc-bundles` set Master Path
6. Create the new Managed Master/Team or Reprovison if it is existing

# Ref

* [Configuration as Code (CasC) for Masters | CloudBees Docs](https://docs.cloudbees.com/docs/cloudbees-core/latest/cloud-admin-guide/core-casc-modern)