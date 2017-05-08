# Request tracing

## Deploy zipkin

Install the zipkin server

```
oc create -f deployment.yaml
```
## Configure the service to support request tracing

The zipkin fraction:

```
<dependency>
   <groupId>org.wildfly.swarm</groupId>
   <artifactId>zipkin-jaxrs</artifactId>
 </dependency>
```

Zipkin configuration (here assuming a openshift deployment):

```
swarm:
  zipkin:
    name: greeting-service
    url: http://zipkin-data-myproject.192.168.64.3.nip.io/api/v1/spans

```

## Invoke on the endpoint to generate data

```
curl http://wfswarm-health-check-myproject.192.168.64.3.nip.io/api/greeting
```

Check the tracing results

```
http://zipkin-data-myproject.192.168.64.3.nip.io/
```
