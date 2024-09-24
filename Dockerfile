FROM maven:3.8.4-openjdk-17 AS stage1
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install
FROM gcr.io/distroless/java17-debian12
WORKDIR /app
COPY --from=stage1 /app/target/*.war app.war
EXPOSE 8091
ENTRYPOINT ["java", "-jar", "app.war"]
