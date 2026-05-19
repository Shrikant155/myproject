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
                withSonarQubeEnv('mysonarqubeserver') {
                    sh '''
                        /opt/sonar-scanner/bin/sonar-scanner

                    '''
                }
            }
        }

   }
} 
        

 
