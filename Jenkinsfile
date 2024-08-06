pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('checkout the code') {
            steps {
                git url: 'https://github.com/subham865/springboot-maven-course-micro-svc.git',
                branch: 'master'
            }
        }
        stage('build the code') {
            steps {
                sh 'mvn clean package'
            }
        }
        // stage("sonar quality check") {
        //     steps {
        //         script {
        //             withSonarQubeEnv(installationName: 'sonar-scan', credentialsId: 'sonar-token') {
        //                 sh 'mvn sonar:sonar'
        //             }

        //             timeout(time: 1, unit: 'HOURS') {
        //                 def qg = waitForQualityGate()
        //                     if (qg.status != 'OK') {
        //                         error "Pipeline aborted due to quality gate failure: ${qg.status}"
        //                     }
        //             }

        //         }
        //     }
        // }
        stage('Docker Build') {
            steps {
                sh 'docker build -t jagdish1983/spring-petclinic:latest .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push jagdish1983/spring-petclinic:latest'
                }
            }

    }
    

}
