FROM openjdk:8-jdk-alpine

WORKDIR /kubernetes-ci-cd
RUN  echo "$(pwd)"
RUN cp ./target/helloworld-0.0.1-SNAPSHOT.jar ./helloworld-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "helloworld-0.0.1-SNAPSHOT.jar"]
