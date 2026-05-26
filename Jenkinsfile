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
             sh 'docker build -t  k8s-app:v5 . '
           }
      }
         stage('trivy-scan') { 
         steps {
             sh '''
                trivy image --exit-code 1 --severity HIGH,CRITICAL k8s-app:v5
                '''  
             }
        }

      stage('docker push') { 
           steps {
              withCredentials([usernamePassword(credentialsId: 'docker-hub-cred-id',
                                                 usernameVariable: 'DOCKER_USER', 
                                                 passwordVariable: 'DOCKER_PASS')]) {
               sh '''
                  echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                  docker tag k8s-app:v5 shrikant155/k8s-app:v5
                  docker push  shrikant155/k8s-app:v5
                 '''
                }
              }
      }
      stage('deploy-local') {
           steps {
             sh '''
              #  docker stop trivy-web-app || true
               # docker rm trivy-web-app || true
                #docker run -d --name trivy-web-app -p 8081:80 trivyapp1:latest
                minikube start 
                kubectl  apply -f deployment.yaml
                kubectl apply -f service.yaml
                minikube service k8s-service --url || true

                '''
               }
      }
   }
} 
        

 
