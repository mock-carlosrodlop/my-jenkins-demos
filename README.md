# My Jenkins Demos

This repo contains code for **demos**

* [Jenkinsfile](resources/pipelines)
* [Jenkins Shared Libraries](vars)
* [CloudBees Pipeline Templates](templates)
* [Configuration as Code (CasC) for Masters](resources/casc)
* [Jenkins CLI](resources/cli)
* [Jenkins API-REST](resources/rest-api)
* [Jenkins agents](resources/agents)

Demo repositories for builds: https://github.com/jenkins-demo

## Structure

Structure compatible with [Pipeline Shared Libraries](https://www.jenkins.io/doc/book/pipeline/shared-libraries/#directory-structure) and [Pipeline Catalogs](https://docs.cloudbees.com/docs/admin-resources/latest/pipeline-templates-user-guide/setting-up-a-pipeline-template-catalog)

```sh
(root)
+- catalog.yaml                        # Catalog definition
+- vars
|   +- foo.groovy                      # for global 'foo' variable
|   +- foo.txt                         # Help for 'foo' variable
+- templates
|   +- bar
|       +- Jenkinsfile                 # Configuration file for bar
|       +- template.yaml               # Template’s parameters for bar
+- resources
|   +- agents
|       +- k8s                         # Agent k8 resources description
|       +- docker                      # Dockerfiles
|   +- cli                             # CLI examples and resources
|   +- pipelines                       # Pipeline examples and resources
|   +- casc                            # Casc Bundles Examples
```