# Contineous intigration
Continuous Integration (CI) is a core DevOps practice where developers frequently merge code changes into a central repository, triggering automated builds and tests to catch errors early, ensuring code quality, and preventing large, complex integration issues by providing rapid feedback on new code's health and stability. It's about automating the build and test stages of software release, making integration a continuous, rather than infrequent, event, leading to faster, more reliable software delivery.
It is the way of integrating the code from source and create artifact. in between source and creating artifact we need to install dependencies, run unit test cases, scans, etc. instead of this manually we can automate through continus integration process... We are using Jenkins for CI.

# Pipeline syntax

```groovy

pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                echo 'hello world'
            }
        }
        stage ('test') {
            steps {
                echo 'this is test'
            }
        }
        stage ('deploy') {
            steps {
                echo 'this is deploy'
            }
        }
    }
}

```

Ci/Cd
Contineous intigration and contineous deployment, contineous delivery

We are using jenkins as cicd tool.
Jenkins is java based application



i know jenkins ci i can do github actions concept is same

code should be in github only if we use github actions.


Master and agent

in ci like jenkins env master cant satisfy all the workload so we can have diff agent with diff configuration while triggering agent we can mention which agent that pipline should run

