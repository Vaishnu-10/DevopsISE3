
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
