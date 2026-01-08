FROM openjdk:17-jre-slim
WORKDIR /app
COPY target/my-app.jar /app/my-app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","my-app.jar"]

