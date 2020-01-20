FROM openjdk:8-jdk-alpine

WORKDIR /kubernetes-ci-cd/target/
RUN  echo "$(ls) "
EXPOSE 8080
ENTRYPOINT ["java","-jar","helloworld-0.0.1-SNAPSHOT.jar"]
