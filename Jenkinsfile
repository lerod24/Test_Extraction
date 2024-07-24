pipeline {
    agent any

    environment {
        JMETER_HOME = '/path/to/jmeter/bin'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run JMeter Tests') {
            steps {
                dir("Test_Extraction") {
                    sh "${JMETER_HOME}/jmeter -n -t Tests.jmx -l results.jtl"
                }
            }
        }

        stage('Generate CSV') {
            steps {
                script {
                    def results = readFile 'Test_Extraction/results.jtl'
                    // Code pour convertir les résultats en CSV
                    writeFile file: 'Test_Extraction/results.csv', text: results
                }
            }
        }

        stage('Plot Graphs') {
            steps {
                plot csvFileName: 'results.csv',
                     group: 'Performance',
                     style: 'line',
                     title: 'Test Performance',
                     yAxis: 'Response Time',
                     csvSeries: [[file: 'Test_Extraction/results.csv', label: 'JMeter']]
            }
        }
    }
}
