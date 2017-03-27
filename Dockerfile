FROM maven:3.3.9-jdk-8-onbuild
CMD ["java","-jar","/usr/src/app/target/bankapp-1.0-SNAPSHOT-jar-with-dependencies.jar"]
