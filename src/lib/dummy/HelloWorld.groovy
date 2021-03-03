#!/usr/bin/env groovy

// Ref:https://www.jenkins.io/doc/book/pipeline/shared-libraries/#accessing-steps
package lib.dummy

def greating (msg) {  
    stage("Hello") {
        println( "${msg}")
        sh "echo ${msg}"       
    }
}

return this