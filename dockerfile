FROM maven:3.8.3-openjdk-11 AS MAVEN_ENV
WORKDIR /build/
COPY pom.xml /build
COPY src /build/src
RUN mvn clean package -DskipTests

FROM adoptopenjdk:11-jre-hotspot as builder
WORKDIR /application
ARG JAR_FILE=target/*.jar
COPY --from=MAVEN_ENV /build/${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract
RUN echo $(ls -1 /application)

FROM adoptopenjdk:11-jre-hotspot
COPY --from=builder /application/dependencies/ ./
RUN true
COPY --from=builder /application/spring-boot-loader/ ./
RUN true
COPY --from=builder /application/snapshot-dependencies/ ./
RUN true
COPY --from=builder /application/application/ ./
EXPOSE 9000
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]