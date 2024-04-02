FROM  openjdk:8
LABEL "MAINTAINER"="tchattua@gmail.com"
ADD jarstaging/com/goumgue/agt-workshop/2.1.2/agt-workshop-2.1.2.jar appagt.jar
ENTRYPOINT ["java", "-jar", "appagt.jar"]