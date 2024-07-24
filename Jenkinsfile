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

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'Test_Extraction/results.jtl', allowEmptyArchive: true
            }
        }

    }
}
