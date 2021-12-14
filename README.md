# TCS-iOn-Rio
A basic <b>spring boot</b> <em>REST web application</em> served with <b>tomcat</b> that lets you store users and fetches all the stored users using <b>mysql</b> database.


## Installation

- `git clone git@github.com:sourikghosh/tcs-ion-rio.git`
- `cd tcs-ion-rio`
- `cat .env.example > .env`<br>
Fill the env with the appropriate values
- `make db_files`<br>
This is the dir where mysql data is persisted.
- `make start` <br>
This will start the webserver on port 8080 by running a docker-compose which spins up a mysql db
which reads the envs from the .env.


## Make command
- `start` runs the docker-compose
- `stop` removes the docker-compose containers and networks
- `db_files` makes a data dir if not already created to store the mysql data
- `db_rm` removes/clean all the persisted data of mysql db

### Docker Image
[sourikg/backend-spring:latest](https://hub.docker.com/r/sourikg/backend-spring)

### REST-Endpoints
- create/store a user
```bash
curl -X POST localhost:8080/demo/add -d name=Sourik -d email=xyz@gmail.com
```
- list all the stored user
```bash
curl localhost:8080/demo/all
```

## Steps to deploy on Docker Swarm
- `docker swarm init`
- `docker stack deploy --compose-file=docker-compose.yml backend-spring`


### Interact with docker swarm
- `docker stack ls` - this will list all the stack deployed
- `docker stack rm <stack_name/s>` - this removes the deployed stack.If want to remove all the stack then add `$(docker stack ls -q)`
