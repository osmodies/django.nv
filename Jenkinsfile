#!/usr/bin/env groovy
pipeline {
    agent any
    
    environment {
        registryUrl = "gitlab-registry-r3b5t1hx.lab.practical-devsecops.training"
        registryCreds = "registry-auth"
        dockeruser = "root"
        dockerpass = "pdso-training"
        hostprod="prod-r3b5t1hx"
    }
    options {
        gitLabConnection('gitlab')
    }

    stages {
        stage("build") {
            agent { 
                docker { 
                    image 'python:3.6'
                    args '-u root'
                }
            }
            steps {
                sh """
                pip3 install --user virtualenv
                python3 -m virtualenv env
                . env/bin/activate
                pip3 install -r requirements.txt
                python3 manage.py check
                """
            }
        }
        stage("test") {
            agent { 
                docker { 
                    image 'python:3.6'
                    args '-u root'
                }
            }
            steps {
                sh """
                pip3 install --user virtualenv
                python3 -m virtualenv env
                . env/bin/activate
                pip3 install -r requirements.txt
                python3 manage.py test taskManager
                """
            }
        }
        stage("release"){
            steps{
                script {
                    dockerImage = docker.build registryUrl + "/root/django-nv:$BUILD_NUMBER"
                    docker.withRegistry('https://' + registryUrl, registryCreds) {   
                        dockerImage.push()
                    }
                }
            }
        }
        stage("integration") {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    echo "This is an integration step"
                    sh "exit 1"
                }
            }
        }
        stage("prod") {
            when { tag "release-*" }
            steps {
                input "Deploy to production?"
                sshagent(['ssh-prod']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no root@$hostprod '
                    docker login -u $dockeruser -p $dockerpass $registryUrl
                    docker rm -f django.nv
                    docker pull $registryUrl/root/django-nv:$BUILD_NUMBER
                    docker run -d --name django.nv -p 8000:8000 $registryUrl/root/django-nv:$BUILD_NUMBER
                    '
                    """
                }
            }
        }
    }
    post {
        failure {
            updateGitlabCommitStatus(name: "${env.STAGE_NAME}", state: 'failed')
        }
        unstable {
            updateGitlabCommitStatus(name: "${env.STAGE_NAME}", state: 'failed')
        }
        success {
            updateGitlabCommitStatus(name: "${env.STAGE_NAME}", state: 'success')
        }
        aborted {
            updateGitlabCommitStatus(name: "${env.STAGE_NAME}", state: 'canceled')
        }
        always { 
            deleteDir()                     // clean up workspace
        }
    }
}
