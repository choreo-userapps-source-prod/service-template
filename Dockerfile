# FROM choreoipaas/choreo-ballerina:observability-improvements AS builder 
FROM mirage20/test-bal:latest AS builder 

WORKDIR /tmp/
COPY ./pService/ /tmp/
RUN ballerina build -a


FROM mirage20/test-bal:latest
COPY --from=builder /tmp/target/bin/*.jar .
COPY ballerina.conf .
CMD java -jar *.jar
