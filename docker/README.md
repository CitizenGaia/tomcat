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
