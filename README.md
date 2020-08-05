# Jenkins SCM Home

This repo contains code for **demos**

* [Jenkinsfile](resources/pipelines)
* [Jenkins Shared Libraries](vars)
* [CloudBees Pipeline Templates](templates)
* [Configuration as Code (CasC) for Masters | CloudBees Docs](casc)
* [Jenkins CLI](resources/cli)
* [Jenkins API-REST](resources/rest-api)
* [Jenkins agents](resources/agents)

Demo repositories for builds: https://github.com/jenkins-demo

## Structure

Merging structure from Pipeline Shared Libraries and Pipeline Catalogs

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
|              +- agent.yaml           # Pod Agent description
|   +- cli
|       +- pipeline-template-catalogs
|              +- catalog.import.json  # Import definition for the Catalog  
|   +- pipelines                       # Pipeline examples
|       +- templates
|           +- bar
|              +- Jenkinsfile          # Pipeline for template example
```