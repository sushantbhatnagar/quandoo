node{
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
            def myTestContainer = docker.image('sushantbhatnagar/dockerized_quandoo:test_0.1')
            myTestContainer.pull()
            // When the Pipeline executes, Jenkins will automatically start the specified container and execute the defined steps within it
            myTestContainer.inside(){
               echo 'inside container'
               ls
               sh 'cucumber -p secure_area -t @login BROWSER=chrome'
               echo 'Tests Completed!!'
             }
        }
    }