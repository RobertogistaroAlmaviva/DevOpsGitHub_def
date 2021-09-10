#!groovy
import groovy.json.JsonSlurperClassic
node {
 environment {
       env.PATH = env.PATH + ";c:\\Windows\\System32"
   }
    def BUILD_NUMBER=env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR="tests/${BUILD_NUMBER}"
    def SFDC_USERNAME

    def HUB_ORG=env.HUB_ORG_DH_demo
    def SFDC_HOST = env.SFDC_HOST_DH_demo
    def JWT_KEY_CRED_ID ="98174196-fc29-4a2c-aeca-a2ec83934b57"
    def CONNECTED_APP_CONSUMER_KEY=env.CONNECTED_APP_CONSUMER_KEY_DH_demo

    println 'KEY IS****' 

    println JWT_KEY_CRED_ID
    println env.PATH
    println HUB_ORG
    println SFDC_HOST
    println CONNECTED_APP_CONSUMER_KEY
    
    stage('checkout source') {
        // when running in multi-branch job, one must issue this command
        checkout scm
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
        stage('Deploye Code') {
            if (isUnix()) {
                rc = sh returnStatus: true, script: "${toolbelt} force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            }else{
                 rc = bat returnStatus: true, script: "\"C:\\Program Files\\sfdx\\bin\\sfdx\" --version"
                 rc = bat returnStatus: true, script: "\"C:\\Program Files\\sfdx\\bin\\sfdx\"  force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile  ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            }
            if (rc != 0) { error 'hub org authorization failed' }

			println rc
		if (isUnix()) {
				rmsg = sh returnStdout: true, script: "${toolbelt} force:mdapi:deploy -d manifest/. -u ${HUB_ORG}"
			}else{
			   rmsg = bat returnStdout: true, script: "\"C:\\Program Files\\sfdx\\bin\\sfdx\" force:mdapi:deploy -d manifest/. -u ${HUB_ORG}"
			}
			
			
            printf rmsg
            println('Hello from a Job DSL script!')
            println(rmsg)
        }
    }
}
