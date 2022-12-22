FROM adoptopenjdk/openjdk:11
ARG JAR_FILE_PATH=*-SANPSHOT.jar
COPY ${JAR_FILE_PATH} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
