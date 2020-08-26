package groovy.jenkins

def busyExecutors = Jenkins.instance.computers.collect {c -> 
                    c.executors.findAll { it.isBusy() }
                    }.flatten() // reminder: transforms list(list(executor)) into list(executor)
println "Running Jobs"
busyExecutors.each { e ->
  println e.currentExecutable.fullDisplayName
}
return