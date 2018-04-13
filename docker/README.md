Docker image for Tomcat base
============================

This repository is to maintain the docker base image for Tomcat based
images. It is built on dockerhub on
https://hub.docker.com/r/skatekapital/commons.tomcat-base/


Intention
=========

To serve as a base image for tomcat based backend applications. The
docker image is not intended to be run directly.


Usage
=====

Users (inheritant) images of this docker image should provide a
```
/Manifest/version.properties
```
which should reveal some versioning information about the docker image.

Running
=======

Even though this image is not ment to be run, you can test it with:

```
docker run --rm -it -p 8080:8080 -v /tmp/logs:/hostfs/tomcat/logs skatekapital/commons.tomcat-base
```

Please check that the log folder and its data, are present on the host
machine after deployment.

Development
===========

During development the docker image can be built using

```
./gradlew buildImage
```


<figure>
<img src="http://www.hypergrid.com/wp-content/themes/hypergrid/img/logo.png" alt="" />
</figure>

HyperGrid - Basic Docker Tomcat Example 
===========================

This is the most basic Docker Tomcat example to demonstrate how an image is built using a Dockerfile that copies a sample Java WAR file. Once you build your own Tomcat image, you can push it to your Docker Hub repository and then run a container using this image on any Linux host that is Docker-enabled.

### Clone this project

You can clone this project:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git clone https://github.com/hypergrid-inc/basic-docker-tomcat-example.git
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Build an image using the cloned project

cd into the directory of the cloned GitHub project

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker build -t <your-username>/tomcat:latest .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sign up for an account on Docker Hub and create a public tomcat repository

-   Sign up for a free account on Docker Hub – <a href="https://hub.docker.com/">***https://hub.docker.com/***</a>

-   Create a public repository called “tomcat”

### Push the created image to your Docker Hub repository

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker login
docker push <your-username>/tomcat:latest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Run the container on a Docker-enabled Linux host

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker run -p 8080:8080 -d --name tomcat  <your-username>/tomcat:latest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Access the sample application

You can access the sample application on this URL:
http://<host-ip>:8080/sample

### Access the logs

You can use this simple command to check the catalina logs of the Tomcat container

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker logs tomcat
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Check the files inside the container

You can run this command to enter the container and check the files under the webapps directory

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker exec -it tomcat bash
ls -lrt /usr/local/tomcat/webapps
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


