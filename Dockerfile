FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar $PROJECT_HOME/spring-petclinic.jar

WORKDIR $PROJECT_HOME

#CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-petclinic.jar"]

CMD ["java", "-jar", "./spring-petclinic.jar"]
