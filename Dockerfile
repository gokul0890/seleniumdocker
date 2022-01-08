FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

#workspace
WORKDIR /usr/share/udemy

#copy
ADD target/selenium-docker.jar   selenium-docker.jar
ADD target/selenium-docker-tests.jar selenium-docker-tests.jar
ADD target/libs  libs
ADD healthcheck.sh healthcheck.sh

#suitefiles
ADD search-module.xml  search-module.xml
ADD book-flight-module.xml	book-flight-module.xml

ENTRYPOINT sh healthcheck.sh