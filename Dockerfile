# Use an OpenJDK base image
FROM openjdk:17

# Set working directory inside container
WORKDIR /app

# Copy the WAR/JAR from your project into the container
COPY target/my-app.jar .

# Run the app
CMD ["java", "-jar", "my-app.jar"]



