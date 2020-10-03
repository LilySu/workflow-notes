#### List running containers
```
docker ps
```
#### Docker Build All
```
docker build .
```

### Docker-Compose
#### Update with Changes if Volume Not Mounted Changed File
```
docker-compose --build
```

### Run bash command inside Docker container
```
docker exec -it <container_id_or_name> bash
```
or /bin/bash

#### Display detailed information on docker container
```
docker container inspect <container_id_or_name>
```


#### tells you which executable
```
which ps
ls -l /usr/bin/ps
```

#### Create and run a docker container Give Container a name:
```
docker container run --name=myhttpd --detach httpd:alpine

docker container ps
```

#### Bash to run inside - move files around, everything you can do within a remote server
#### Look around at the file system
```
docker container exec -it myhttpd /bin/sh

ls

ls htdocs/

ps
```

#### to copy a file inside a container to whereever you are:
docker container cp myhttpd:/usr/local/apache2/htdocs/index.html .

#### Stop a container
docker container stop myhttpd

#### Show all stopped and running containers
docker container ps - a

#### You can copy files out of a dead containers as well
docker container cp myhttpd:/usr/local/apache2/htdocs/index.html .


### Images:
#### If build fails:
docker container ps -a
#### Shows where id of which layer the container stopped
#### Get first few id's of the last image
docker container cp f429a6:/tmp/pip.log .

#### To be exactly where step 4 is when failed:
#### Be in bash command to look inside what's going on.
```
docker container run -it --entrypoint = bash a45634

docker container run -it bash print
```
#### You cannot run a bash shell in a dead container but you can run a new container and bash into that

#### to simulate problem
```
docker container run --name=mycontainer2 -it --entrypoint=bash python:3.8-slim-buster

docker container ps -a

docker container commit mycontainer2 debug

docker image ls debug

docker container run -it --entrypoint=bash debug
```
#### we see a new container created from the files of the dead container
ls