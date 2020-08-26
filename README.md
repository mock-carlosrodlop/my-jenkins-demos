# My Jenkins Demos

This repo contains code for **demos**

* [Jenkinsfile](resources/pipelines)
* [Jenkins Shared Libraries](vars) and [Groovy src](src)
* [CloudBees Pipeline Templates](templates)
* [Configuration as Code (CasC) for Masters](resources/casc)
* [Jenkins CLI](resources/cli)
* [Jenkins API-REST](resources/rest-api)
* [K8](resources/k8s)
* [Docker](resources/docker)

Demo repositories for builds: https://github.com/jenkins-demo

## Structure

Structure compatible with [Pipeline Shared Libraries](https://www.jenkins.io/doc/book/pipeline/shared-libraries/#directory-structure) and [Pipeline Catalogs](https://docs.cloudbees.com/docs/admin-resources/latest/pipeline-templates-user-guide/setting-up-a-pipeline-template-catalog)

```sh
(root)
+- catalog.yaml                        # Catalog definition
+- src                                 # groovy src
+- vars
|   +- foo.groovy                      # for global 'foo' variable
|   +- foo.txt                         # Help for 'foo' variable
+- templates
|   +- bar
|       +- Jenkinsfile                 # Configuration file for bar
|       +- template.yaml               # Template’s parameters for bar
+- resources
|   +- ks8                             # K8 resources description
|   +- docker                          # Dockerfiles
|   +- cli                             # CLI examples and resources
|   +- pipelines                       # Pipeline examples and resources
|   +- casc                            # Casc Bundles Examples
```

## Reference

* [Write Groovy scripts for Jenkins with code completion](https://www.mdoninger.de/2011/11/07/write-groovy-scripts-for-jenkins-with-code-completion.html)
* [Pipeline Shared Libraries and Template Catalogs](https://www.cloudbees.com/blog/pipeline-as-code)
