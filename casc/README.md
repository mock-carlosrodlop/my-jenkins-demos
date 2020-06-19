# Steps

1. Get output from `$MASTER_URL/core-casc-export/`, separate yaml documents into diffrent files and place them into the same bundle
2. Edit files according to your needs (e.g. remove secrets) and validate them using http://www.yamllint.com/
3. Import bundle into OC `$JENKINS-HOME/jcasc-bundles-store` using the importer job `importer-config.xml`
4. Navigate to `$OC_URL/cjoc/core-casc-bundles` and check the Bundle has been imported correctly
5. In `$OC_URL/cjoc/core-casc-bundles` set Master/Team Path in the Operation Center JENKINS_HOME for the exiting or new Masters (e.g /var/jenkins_home/jobs/Teams/jobs/team-example => Teams/team-example)
6. Create the new Managed Master/Team or Reprovison if it is existing Teams/fake-dse-team-emea

# Ref

* [Configuration as Code (CasC) for Masters | CloudBees Docs](https://docs.cloudbees.com/docs/cloudbees-core/latest/cloud-admin-guide/core-casc-modern)