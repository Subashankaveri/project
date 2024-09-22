FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/CRUDWithPostgresJSPExample-1.0-SNAPSHOT.war app.war
EXPOSE 8091
ENTRYPOINT ["java", "-jar", "app.war"]
