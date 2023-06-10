# base image
FROM openjdk:8
COPY . /src/java
WORKDIR /src/java
RUN ["javac", "PrimeNo.java"]
ENTRYPOINT ["java", "PrimeNo"]Jenkinsfile:
pipeline
{
environment
{
registry = "vm1005/devopsise3"
registryCredential = 'dockerid'
dockerImage = ''
}
agent any
stages
{
stage('Build image')
{
steps
{
script
{
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy the image')
{
steps
{
script
{
docker.withRegistry( '',registryCredential )
{
dockerImage.push()
}
}}
}
}
}
