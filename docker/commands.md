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