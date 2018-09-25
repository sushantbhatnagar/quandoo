node {
  // configuration
  def to = emailextrecipients([
          [$class: 'sushantbhatnagar10@gmail.com'],
          [$class: 'sushant91bhatnagar@gmail.com']
  ])

  //job
  try {
   stage('Preparation') {
     checkout scm
   }
   stage('Test') {
     bat 'cucumber -p secure_area features BROWSER=chrome'
   }
   stage('Docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
     def dockerfile = 'Dockerfile_chrome'
     def app = docker.build("sushantbhatnagar/dockerized_quandoo", "-f ${dockerfile}")
     app.push('latest')
     }
   }
  }
  catch(e) {
    // mark build as failed
    currentBuild.result = "FAILURE";

    // set variables
    def subject = "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} ${currentBuild.result}"
    def content = '${JELLY_SCRIPT,template="html"}'

    // send email
    if(to != null && !to.isEmpty()) {
      emailext(body: content, mimeType: 'text/html',
         replyTo: '$DEFAULT_REPLYTO', subject: subject,
         to: to, attachLog: true )
    }

    // mark current build as a failure and throw the error
    throw e;
  }
}
