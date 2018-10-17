node(){
    stage('Preparation') {
        checkout scm
    }
    //stage('Docker build/push') {
      //   withEnv(["PATH+cygwin=C:/cygwin/bin:$PATH"]){
        //    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
          //      def dockerfile = 'Dockerfile_chrome'
            //    def app = docker.build("sushantbhatnagar/dockerized_quandoo", "-f ${dockerfile} .")
              //  app.push('test_0.1')
            //}
         //}
    //}
    stage('Container Tests') {
            withEnv(["PATH+cygwin=C:/cygwin/bin:$PATH"]){
                def myTestContainer = docker.image('sushantbhatnagar/dockerized_quandoo:test_0.1')
                myTestContainer.pull()
                // myTestContainer.inside() {
                // withDockerContainer('myTestContainer') {
                   // echo 'inside container'
                    //sh 'cucumber -p secure_area -t @login BROWSER=chrome'
                    //echo 'Tests Completed!!'
                //}
            //}
         }
      }
}