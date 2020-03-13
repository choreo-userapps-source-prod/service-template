# FROM choreoipaas/choreo-ballerina:observability-improvements AS builder 
FROM choreoipaas/choreo-ballerina:observability-improvements AS builder 

WORKDIR /tmp/
COPY ./pService/ /tmp/
RUN ballerina build -a || test $(find /tmp/target/bin/ -name *.jar)


FROM openjdk:8-jre
COPY --from=builder /tmp/target/bin/*.jar .
COPY ballerina.conf .
CMD java -jar *.jar
