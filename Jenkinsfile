pipeline {
  agent any
  stages {
    stage('checkout')
           {
       steps {
         git branch: 'man',
         url: 'https://github.com/Shrikant155/myproject.git',
          credentialsId: 'github-cred-id'
       }
     }
     stage('sonarqube') {
       steps{
        sh '''
           echo "ok i am running" 
         '''
          }
      }
   }
} 
        

 
