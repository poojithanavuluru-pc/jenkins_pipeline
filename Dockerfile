# Use OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy jar/war file into container
COPY target/my-app.jar /app/my-app.jar

# Expose port (if needed)
EXPOSE 8080

# Command to run the app
CMD ["java", "-jar", "my-app.jar"]


