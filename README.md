# Base Tomcat - Docker Image

Docker image of a tomcat with a small ROOT.war that returns 'OK' when request hit e.g. http://localhost:8080/

Heavily inspired from davidcaste.
It's purpose is to create a base tomcat image with:
- a Manifest.version file that keeps a reference to a given build and test cycle.
- an easy way to keep log-folders at hand when the container is runnning (-v param)
- an easy way to apply WAR-files and server configurations for inheritant docker images

The Travis CI relation hook will pull changes and run tests before creating the docker image.

# Run container 
```
docker run --rm -p '8080:8080' -d -v '/home/ubuntu/project/logs:/hostfs/tomcat/logs' --name=tomcat citizengaia/tomcat
```
The -v parameter above points that I want all relevant logs from the running container placed locally at /home/ubuntu/project/logs.
The --name are relevant when I want to link the container using e.g. docker compose and for convenience.
The -p is the portmapping.



