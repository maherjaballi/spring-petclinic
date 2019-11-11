FROM openjdk:8-alpine

#docker run -e MYSQL_ROOT_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:5.7.8

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar $PROJECT_HOME/spring-petclinic.jar

WORKDIR $PROJECT_HOME

CMD ["java", "-Dspring.data.mysql.uri=mysqldb://mysql:3306/spring-mysql","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-petclinic.jar"]

#CMD ["java", "-jar", "./spring-petclinic.jar"]
