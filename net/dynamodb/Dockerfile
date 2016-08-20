FROM openjdk:7-jre-alpine

RUN mkdir /var/dynamodb_wd
RUN mkdir /var/dynamodb_local
WORKDIR /var/dynamodb_wd

RUN wget -q http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar zxf dynamodb_local_latest.tar.gz && rm dynamodb_local_latest.tar.gz

EXPOSE 8000

VOLUME /var/dynamodb_wd

ENTRYPOINT ["java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-port", "8000"]
