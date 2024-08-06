FROM openjdk
COPY targetff/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
