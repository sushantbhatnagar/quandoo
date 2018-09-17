node {
   stage('Preparation') {
     checkout scm
   }
   stage('Test') {
     sh 'cucumber -p secure_area features BROWSER=chrome'
   }
   stage('Docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
     def dockerfile = 'Dockerfile_chrome'
     def app = docker.build("sushantbhatnagar/dockerized_quandoo", "-f ${dockerfile}")
     app.push('latest')
     }
   }
}
