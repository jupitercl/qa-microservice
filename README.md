# QA Microservice
### Development environment with docker-compose

Build image
```
docker-compose build api
```
Up container
```
docker-compose up -d
```

### Production environment

Build image
```
docker build --build-arg PASS=rootpass -t qa/microservice . 
```

Run container
```
docker run -d -p 8080:8080 -p 2222:22 --name container_qa_microservice qa/microservice
```
