Docker image for Tomcat base
============================

This repository is to maintain a docker base image for Tomcat based
images. 


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
docker run -p 8080:8080 -v '/home/tmp/logs:/hostfs/tomcat/logs'--name=tomcat citizengaia/tomcat:1.0-SNAPSHOT
```

Please check that the log folder and its data, are present on the host
machine after deployment.

Development
===========

During development the docker image can be built using

```
mvn clean install 
```

