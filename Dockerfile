FROM openjdk:8-jdk-alpine

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/target/helloworld-0.0.1-SNAPSHOT.jar"]

