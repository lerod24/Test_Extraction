pipeline {
    agent any

    stages {
        stage('Cloner le Dépot git') {
            steps {
                git 'https://github.com/lerod24/Test_Extraction.git'
            }
        }

        stage('Exécuter les Tests JMeter') {
            steps {
                script {
                    // Exécuter les tests JMeter
                    bat 'jmeter -n -t Test_Extraction/Tests.jmx -l Test_Extraction/results.jtl'
                }
            }
        }

        stage('Publier les resultats de Performance') {
            steps {
                perfReport filterRegex: '', sourceDataFiles: 'results.jtl'
            }
        }
    }
}
