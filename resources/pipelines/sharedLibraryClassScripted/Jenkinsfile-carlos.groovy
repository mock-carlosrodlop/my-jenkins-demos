#!/usr/bin/env groovy

@Library(["my-test-lib@master"]) _

import lib.dummy.HelloWorld_v1

def g 

node {
    g = new HelloWorld_v1()
    g.greating ("Hola")
}