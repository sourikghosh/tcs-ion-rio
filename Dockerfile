# Build Stage - builds the war package
FROM maven:3.6.0-jdk-11-slim AS builder

# coping source code to container
COPY src /home/app/src

#coping pom.xml to container
COPY pom.xml /home/app

RUN mvn -f /home/app/pom.xml clean package


# Deploy stage - extract and runs the war file
FROM tomcat:8.5.73-jdk11-temurin AS deploy

# removing any default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# coping the war from builder-stage
COPY --from=builder /home/app/target/accessing-data-mysql-complete-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh","run"]