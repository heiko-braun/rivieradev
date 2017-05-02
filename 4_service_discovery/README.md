# Service discovery using consul

## Start consul

```
docker pull progrium/consul
docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h node1 progrium/consul -server -bootstrap -ui-dir /ui
```

Check the UI is accessible:

```
http://localhost:8500/ui/#/dc1/services
```

## Add topology fraction

```
<dependency>
   <groupId>org.wildfly.swarm</groupId>
   <artifactId>topology-consul</artifactId>
</dependency>
```

Configure it:
```
swarm:
  topology:
    consul:
      url: http://localhost:8500
...
```

Expose your service

```
@Path("persons")
@Advertise("person-service")
public class PersonResource {
  ...
}
```

## Lookup

Either use the UI or curl:

Services that exists:
```
curl http://localhost:8500/v1/catalog/services
{
    "consul": [],
    "person-service": [
        "http"
    ]
}

```

Get service details:

```
curl  http://localhost:8500/v1/catalog/service/person-service
[
    {
        "Address": "172.17.0.2",
        "Node": "node1",
        "ServiceAddress": "0:0:0:0:0:0:0:0",
        "ServiceID": "person-service:0:0:0:0:0:0:0:0:8080",
        "ServiceName": "person-service",
        "ServicePort": 8080,
        "ServiceTags": [
            "http"
        ]
    }
]

```

## Discovery

```
@GET
@Path("lookup")
public Response get() throws Exception {
   Map<String, List<Topology.Entry>> services = Topology.lookup().asMap();

   for (String key : services.keySet()) {
       Topology.Entry entry = services.get(key).get(0);
       System.out.println(key +" ->" + entry.getAddress()+":"+entry.getPort());
   }

   return Response.ok().build();
}
```
