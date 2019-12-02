node{
    
    stage("Git Clone"){
        git credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/maherjaballi/spring-petclinic.git'
    }
    
    stage("Maven Clean Build"){
        def mavenHome = tool name: "Maven-3.6.2", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
       
    }
    
    stage("Build Docker Image"){
        
        sh "docker build -t mjaballi/spring-petclinic  ."
    }
    
    stage("Docker Push"){
        withCredentials([string(credentialsId: 'DOCKER_HUB_CRED', variable: 'DOCKER_HUB_CRED')]) {
    // some block
             sh "docker login -u mjaballi -p ${DOCKER_HUB_CRED}"
            }
        sh "docker push mjaballi/spring-petclinic"
       /* sh "docker run -e MYSQL_ROOT_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:5.7.8"
       */
    }
    
    stage("Deploy Application in k8s cluster"){
        kubernetesDeploy(
            configs: 'springBootMongo.yml',  
            kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
            enableConfigSubstitution: true
          
            )
           }
}
