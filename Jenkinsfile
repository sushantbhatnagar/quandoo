// Scripted Pipeline syntax
node {
  // configuration
  def to = emailextrecipients([
          // send email to all folks who have committed the code since the last successful build.
          [$class: 'CulpritsRecipientProvider'],

          // send email to the developer who has checked in the code for the last build
          [$class: 'DevelopersRecipientProvider'],

          // send email to the person who has triggered the build (manually)
          [$class: 'RequesterRecipientProvider']
  ])

  //job
  try {
   stage('Preparation') {
     // checkout - checks out the code from source control
     // scm - instructs checkout to checkout the code from specific revision that triggered the pipeline
     checkout scm
   }
   stage('Test') {
     // run tests after Build is a success
     bat 'cucumber -p parallel features BROWSER=chrome'
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
    echo 'Email notification sent'

    // mark current build as a failure and throw the error
    throw e;
  }
}
