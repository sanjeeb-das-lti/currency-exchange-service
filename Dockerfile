FROM openjdk:11
EXPOSE 8000
ADD target/currency-exchange-ser-github-action.jar currency-exchange-ser-github-action.jar
ENTRYPOINT ["java","-jar","currency-exchange-ser-github-action.jar"]