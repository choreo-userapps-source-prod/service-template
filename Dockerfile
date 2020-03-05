FROM choreoipaas/ballerina:observability-improvements AS builder 

WORKDIR /tmp/
COPY ./pService/ /tmp/
RUN ballerina build -a


FROM openjdk:8-jre
COPY --from=builder /tmp/target/bin/*.jar .
COPY ballerina.conf .
CMD java -jar *.jar
