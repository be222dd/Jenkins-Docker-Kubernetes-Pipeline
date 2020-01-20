FROM openjdk:8-jdk-alpine

WORKDIR /usr/src/app
COPY . .
EXPOSE 8080
ENTRYPOINT ["java","-jar","helloworld-0.0.1-SNAPSHOT.jar"]
