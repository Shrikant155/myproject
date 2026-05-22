pipeline {
  agent any
  stages {
    stage('checkout')
           {
       steps {
         git branch: 'main',
         url: 'https://github.com/Shrikant155/myproject.git',
          credentialsId: 'github-cred-id'
       }
     }
     stage('sonarqube-test-code') {
            steps {
                withSonarQubeEnv('shrikant-sonar-scanner') {
                    sh '''
                        
                      /opt/sonar-scanner/bin/sonar-scanner \
                     -Dsonar.projectKey=my-devops-project \
                     -Dsonar.projectName="devops web proejct" \
                     -Dsonar.sources=. \
                     -Dsonar.java.binaries=.
                    '''
                }
            }
        }
       stage('build-image') {
        steps {
             sh 'docker build -t trivyapp1:latest . '
           }
      }
      stage('trivy-scann-image') {
         steps {
             sh '''
                trivy image --exit-code 1 --severity HIGH,CRITICAL trivyapp1:latest
                '''       
             }
      }
      stage('deploy-local') {
           steps {
             sh '''
                docker stop trivy-web-app || true 
                docker rm  trivy-web-app || true
                docker run -d --name trivy-web-app:latest -p 80:80 trivyapp1:latest
                '''
               }
      }
   }
} 
        

 
