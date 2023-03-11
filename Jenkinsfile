@Library(['jenkins2-shared-library'])_ 
def server = Artifactory.server 'artifactory-fs'
def version = "1.0.0.${BUILD_NUMBER}"
def branch = "datascience-database-deployment"
def rtMaven = Artifactory.newMavenBuild()
def buildInfo
def rollbackInDev = true
def rollbackInQa = true
def rollbackInUat = true
def rollbackInProd = true
def ToMail_Id = "joshi.aditya303@gmail.com"

pipeline {
    agent none
    options {
        // if any step should fail, then the whole pipeline is failed
        parallelsAlwaysFailFast()
    timestamps()
    }

  tools {
    jdk "jdk-17.0.2"
    maven "maven-3.8.6"
  }

  environment {
    PROJECT_NAME = "DataDBliquibase"
    PROJECT_ID = "Azuresql"
    GROUP_ID = "test"
    POM = "pom.xml"
    DEPLOYVERSION = "${params.DEPLOYVERSION}"
    LIQUIBASE_COMMAND_CHANGELOG_FILE="changelog.sql"
    
  }

    parameters {
        string(name: 'datascience-database-deployment', defaultValue: "main", description: 'datascience-database-deployment GIT Repo Branch to use')
    }
    /*parameters{
        choice(name: 'Database_ENV', choices: "\nDEV\nUAT\nPROD", description: 'Select environment to deploy')
    }*/
    stages {
        stage('Upload to Artifact') {
		     agent { label 'linux' }
         when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                   // expression { params.Database_ENV == "" }
                }
            }
           steps {
                script {
                uploadSpec = """{
                  "files": [{
                    "target": "testdir/com/${PROJECT_ID}/${version}/${PROJECT_ID}-${version}.sql",
                    "pattern": "$LIQUIBASE_COMMAND_CHANGELOG_FILE"
                  }]
                  }"""
              server.upload spec: uploadSpec
              buildInfo = server.upload uploadSpec
              rtBuildInfo(captureEnv: true, )
              server.publishBuildInfo buildInfo
                }//script
           }//steps
        }//stage

        /*stage ('Authorize Dev Deploy') {
            when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                   // expression { params.Database_ENV == "" }
                }
            }
            steps {
                emailext(
                    subject: "Authorization request for Dev Deployment '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: """<p>Hi,</p>
                                <p>Jenkins needs your Authorization to proceed further with Dev deployment : '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                                <p>Kindly approve it, if artifact needs to be deployed on Dev environment. Refer this link to take further action &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                    to: "${ToMail_Id}"
                )
                timeout(time: 1, unit: 'DAYS') {
                    input('Do you want to proceed with deployment to Dev?')
                }
            }//steps
        }//stage

        stage('Deploy to Dev') {
			    agent { label 'linux' }
          //steps {
           //artifactorypubScan buildInfo
            //stash includes: 'target/**', name: 'Deploy'	
           // echo "not now"
         // }//steps
         when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                    //expression { params.Database_ENV == "" }
                }
            }
            steps {
            //withCredentials([usernamePassword(credentialsId: "client-db-sql-dev", passwordVariable: 'password', usernameVariable: 'username')]) { 
            withCredentials([usernamePassword(credentialsId: "db-sql-nonprod-dev", passwordVariable: 'password', usernameVariable: 'username')]) { 
              script {
              downloadSpec = """{
                "files": [{
                "target": "download/$LIQUIBASE_COMMAND_CHANGELOG_FILE",
                "pattern": "fs-mvn-rc-local/com/lv/${PROJECT_ID}/${version}/${PROJECT_ID}-${version}.sql"
                }]
              }"""
              server.download(downloadSpec)
              env.database="sqldb-datascience-dev-non-prod-uksouth-001"
              env.propfile="Dev_liquibase.properties"
              rtMaven.tool = 'maven-3.8.6'
              rtMaven.resolver releaseRepo: 'fs-jvm-virtual', snapshotRepo: 'libs-snapshot', server: server
              buildInfo = Artifactory.newBuildInfo()
              rtBuildInfo(captureEnv: true, )
              sh "cp download/com/lv/${PROJECT_ID}/${version}/$LIQUIBASE_COMMAND_CHANGELOG_FILE $LIQUIBASE_COMMAND_CHANGELOG_FILE"
              
              rtMaven.run pom: 'pom.xml', goals: "liquibase:tag -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password -Dliquibase.tag=${version}".toString(), buildInfo: buildInfo
              rtMaven.run pom: 'pom.xml', goals: "liquibase:update -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password".toString(), buildInfo: buildInfo

                 }//script
               }//withCredentials    
             }//steps
           }//stage
        
        stage ('Authorize UAT Deploy') {
            when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                   // expression { params.Database_ENV == "" }
                }
            }
            steps {
                emailext(
                    subject: "Authorization request for UAT Deployment '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: """<p>Hi,</p>
                                <p>Jenkins needs your Authorization to proceed further with UAT deployment : '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                                <p>Kindly approve it, if artifact needs to be deployed on UAT environment. Refer this link to take further action &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                    to: "${ToMail_Id}"
                )
                timeout(time: 1, unit: 'DAYS') {
                    input('Do you want to proceed with deployment to UAT?')
                }
             } //steps
           }   //stage

        stage('Deploy to UAT') {
			    agent { label 'linux' }
         when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                   // expression { params.Database_ENV == "UAT" }
                }
            }
            steps {
            
            withCredentials([usernamePassword(credentialsId: "client-db-sql-uat", passwordVariable: 'password', usernameVariable: 'username')]) { 
            
              script {
              //clear all checksum will clear all the checksums and recompute the new checksums(checksum id issue)
             
              downloadSpec = """{
                "files": [{
                "target": "download/$LIQUIBASE_COMMAND_CHANGELOG_FILE",
                "pattern": "fs-mvn-rc-local/com/lv/${PROJECT_ID}/${version}/${PROJECT_ID}-${version}.sql"
                }]
              }"""
              server.download(downloadSpec)
              env.database="sqldb-datascience-uat-non-prod-uksouth-001"
              env.propfile="Uat_liquibase.properties"
              rtMaven.tool = 'maven-3.8.6'
              rtMaven.resolver releaseRepo: 'fs-jvm-virtual', snapshotRepo: 'libs-snapshot', server: server
              buildInfo = Artifactory.newBuildInfo()
              rtBuildInfo(captureEnv: true, )
              sh "cp download/com/lv/${PROJECT_ID}/${version}/$LIQUIBASE_COMMAND_CHANGELOG_FILE $LIQUIBASE_COMMAND_CHANGELOG_FILE"
              //rtMaven.run pom: 'pom.xml', goals: "liquibase:clearCheckSums -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password".toString(), buildInfo: buildInfo
              rtMaven.run pom: 'pom.xml', goals: "liquibase:tag -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password -Dliquibase.tag=${version}".toString(), buildInfo: buildInfo
              rtMaven.run pom: 'pom.xml', goals: "liquibase:update -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password".toString(), buildInfo: buildInfo 

                 }//script
              }//withcredentials
             }//steps
            
         }//stage
        */
        stage ('Authorize PROD Deploy') {
            when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                    //expression { params.Database_ENV == "" }
                }
            }
            steps {
                emailext(
                    subject: "Authorization request for PROD Deployment '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: """<p>Hi,</p>
                                <p>Jenkins needs your Authorization to proceed further with PROD deployment : '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                                <p>Kindly approve it, if artifact needs to be deployed on PROD environment. Refer this link to take further action &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                    to: "${ToMail_Id}"
                )
                timeout(time: 1, unit: 'DAYS') {
                    input('Do you want to proceed with deployment to PROD?')
                }
             } //steps
           } 
        
        stage('Deploy to PROD') {
			    agent { label 'linux' }
         when {
                allOf {
                    expression { env.BRANCH_NAME == "main" }
                    //expression { params.Database_ENV == "" }
                }
            }
            steps {
            
            withCredentials([usernamePassword(credentialsId: "client-db-sql-prod", passwordVariable: 'password', usernameVariable: 'username')]) { 
            
              script {
              downloadSpec = """{
                "files": [{
                "target": "download/$LIQUIBASE_COMMAND_CHANGELOG_FILE",
                "pattern": "fs-mvn-rc-local/com/lv/${PROJECT_ID}/${version}/${PROJECT_ID}-${version}.sql"
                }]
              }"""
              server.download(downloadSpec)
              env.database="sqldb-datascience-prod-datascience-prod-uksouth-001"
              env.propfile="Prod_liquibase.properties"
              rtMaven.tool = 'maven-3.8.6'
              rtMaven.resolver releaseRepo: 'fs-jvm-virtual', snapshotRepo: 'libs-snapshot', server: server
              buildInfo = Artifactory.newBuildInfo()
              rtBuildInfo(captureEnv: true, )
              sh "cp download/com/lv/${PROJECT_ID}/${version}/$LIQUIBASE_COMMAND_CHANGELOG_FILE $LIQUIBASE_COMMAND_CHANGELOG_FILE"
              
              rtMaven.run pom: 'pom.xml', goals: "liquibase:tag -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password -Dliquibase.tag=${version}".toString(), buildInfo: buildInfo
              rtMaven.run pom: 'pom.xml', goals: "liquibase:update -Djavax.net.ssl.trustStore=/opt/java/openjdk/lib/security/cacerts -Dliquibase.username=$username -Dliquibase.password=$password".toString(), buildInfo: buildInfo 

                 }//script
              }//withcredentials
             }//steps
            
         }//stage
        
    } //stages
   post {
        failure {
            emailext(
                subject: "Job failed: '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>Hi All,</p>
                            <p>job failed: '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                            <p>Please check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                to: "${ToMail_Id}"
            )
        }
    } //post
 }//pipeline
