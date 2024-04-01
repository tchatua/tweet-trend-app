FROM  openjdk:8
ADD jarstaging/com/goumgue/agt-workshop/2.1.2/agt-workshop-2.1.2.jar ttrend.jar
ENTRYPOINT ["java", "-jar", "ttrend.jar"]