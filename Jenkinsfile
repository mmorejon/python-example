node {
   stage('Checkout Code'){
       checkout([
           $class: 'GitSCM',
           branches: [[name: '*/master']],
           doGenerateSubmoduleConfigurations: false, 
           extensions: [], 
           submoduleCfg: [], 
           userRemoteConfigs: [[url: 'https://github.com/mmorejon/python-example.git']]])
   }
   
   stage('Build Code') {
       sh 'docker image build --tag 192.168.33.22:5000/python:example .'
   }

   stage('Test Code') {
       echo 'No he creado mis pruebas.'
   }
   
   stage('Release to Repository'){
       sh 'docker image push 192.168.33.22:5000/python:example'
   }
   
   stage('Deploy to Production'){
        sh 'scp production.yml ubuntu@192.168.33.21:~'
        sh 'ssh ubuntu@192.168.33.21 docker-compose --file production.yml pull'
        sh 'ssh ubuntu@192.168.33.21 docker-compose --file production.yml up -d'
   }
}