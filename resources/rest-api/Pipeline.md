## Pipeline

[Pipeline REST API](https://plugins.jenkins.io/pipeline-rest-api)

### Checkpoints

```
#List of checkpoints available for specific build
curl -X POST "http://USERNAME:TOKEN@JENKINS_SERVER/job/JOB_NAME/BUILD_NUMBER/wfapi-checkpoints/
curl -X POST "http://admin:******@localhost:8183/job/PL-ZD40206/1/wfapi-checkpoints/
# Similar output like this is expected, where it provides you a container (Array JSON) with the URLs for restart/delete for any of your checkpoints
[{"id":1,"name":"id_1","stageId":"3","restartUrl":"/job/PL-ZD40206/1/checkpoints/1/restart","deleteUrl":"/job/PL-ZD40206/1/checkpoints/1/delete"}]
# For instance, I proceed to restrat
curl -X POST "http://admin:522c579740238f0791d49d205df47323@localhost:8183/job/PL-ZD40206/1/checkpoints/1/restart"
```
