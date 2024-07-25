pipeline {
    agent any

    environment {
        JMETER_HOME = 'C:\\jmeter\\bin'  // Chemin vers le dossier bin de JMeter
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout du code source depuis le référentiel Git
                checkout scm
            }
        }

        stage('Run JMeter Tests') {
            steps {
                dir("Test_Extraction") {
                    bat "${JMETER_HOME}\\jmeter -n -t Tests.jmx -l results.jtl"
                }
            }
        }
        stage('Publish Results') {
            steps {
                perfReport errorFailedThreshold: 5, errorUnstableThreshold: 1,
                    jtlParsableReportFile: 'résultats.jtl',
                    modeOfThreshold: true, relativeFailedThresholdNegative: 10,
                    relativeFailedThresholdPositive: 10, relativeUnstableThresholdNegative: 5,
                    relativeUnstableThresholdPositive: 5
            }

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'Test_Extraction/results.jtl', allowEmptyArchive: true
            }
        }

    }
}
