//https://stackoverflow.com/questions/159148/groovy-executing-shell-commands

package groovy.jenkins

import jenkins.model.Jenkins
def message="foo"
Jenkins jenkins = Jenkins.instanceOrNull
jenkins.setSystemMessage(message)
jenkins.save()