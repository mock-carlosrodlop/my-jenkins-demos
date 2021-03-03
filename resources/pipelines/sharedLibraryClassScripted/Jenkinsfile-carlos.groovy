#!/usr/bin/env groovy

@Library(["my-test-lib@master"]) _

import lib.dummy.HelloWorld

def g 

node {
    g = new HelloWorld()
    g.greating ("Hola")
}