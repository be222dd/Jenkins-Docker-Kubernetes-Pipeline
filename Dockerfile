FROM openjdk:8-jdk-alpine


WORKDIR /target
RUN echo $(pwd)
EXPOSE 8080
ENTRYPOINT ["java","-jar","helloworld-0.0.1-SNAPSHOT.jar"]
