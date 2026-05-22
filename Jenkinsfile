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
     stage('usermsg') {
       steps{
        sh '''
           echo "ok i am running" 
         '''
          }
      }
     stage('sonarqube') {
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

   }
} 
        

 
