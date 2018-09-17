node {
   stage('Preparation') {
     checkout scm
   }
   stage('Test') {
     bat 'cucumber -p secure_area features BROWSER=chrome'
   }
   stage('Docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
     def app = docker.build("sushantbhatnagar/dockerized_quandoo:latest", '--file Dockerfile_chrome .').push()
     }
   }
}
