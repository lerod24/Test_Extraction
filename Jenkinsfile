pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run JMeter Tests') {
            steps {
                script {
                    def jmeterHome = tool name: 'JMeter', type: 'hudson.plugins.jmeter.JMeterInstallation'
                    bat "${jmeterHome}/bin/jmeter -n -t ${WORKSPACE}/Test_Extraction/Tests.jmx -l ${WORKSPACE}/Test_Extraction/results.jtl"
                }
            }
        }

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'Test_Extraction/results.jtl', allowEmptyArchive: true
            }
        }
    }
}
