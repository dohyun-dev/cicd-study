FROM openjdk:11
ARG JAR_FILE=./build/libs/cicd-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=${IDLE_PROFILE}", "-Duser.timezone=Asia/Seoul", "app.jar"]