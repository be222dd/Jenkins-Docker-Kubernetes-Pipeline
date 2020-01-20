FROM openjdk:8-jdk-alpine

WORKDIR /kubernetes-ci-cd/target/
RUN  echo "$(pwd)"
RUN cp ./helloworld-0.0.1-SNAPSHOT.jar ./helloworld-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "helloworld-0.0.1-SNAPSHOT.jar"]
