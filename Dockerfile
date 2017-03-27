FROM java:8

# Install maven
RUN apt-get update
RUN apt-get install -y maven
# RUN unset M2_HOME
WORKDIR /code
# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]
# ENV MAVEN_CONFIG=/home/bankapp/.m2
# RUN adduser --home /home/bankapp --disabled-password --disabled-login --uid 1984 bankapp && \
#     mkdir /home/bankapp/.m2 && \
#     chown -R bankapp /home/bankapp

# USER bankapp    
    
# ADD src /code/src
RUN ["mvn", "package"]

CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/bankapp-1.0-SNAPSHOT-jar-with-dependencies.jar"]

#FROM maven:3.3-jdk-8-onbuild
#CMD ["java","-jar","/usr/src/app/target/bankapp-1.0-SNAPSHOT-jar-with-dependencies.jar"]
