# Configuration Options in Swarm

## Common and suggested: project-defaults.yml

- Project stages
- Command lines switches
- Fractions configuration

## Examples

`src/main/webapp/project-defaults.yml`

```
swarm:
  logging: DEBUG
  http:
    port: 8080
```

`src/main/webapp/project-prod.yml`

```
swarm:
  logging: INFO
  http:
    port: 9090  
```

```
java -jar target/javaee7-simple-sample-swarm.jar --help

WildFly Swarm version 2017.4.0

  -h                                 Display this help
  --help                             

  --config-help=<fraction>           Display configuration help by fraction, or 'all'
  --config-help <fraction>           for all

...

```
And toggle it using `--profile`
```
java -jar target/javaee7-simple-sample-swarm.jar --profile prod
```

## CDI Injection

To `PersonsResource.java`

```
@Inject
@ConfigurationValue("swarm.logging") 
String logLevel;

@GET
@Path("logger/level")
public Response getLogLevel() {
    return Response.ok(logLevel).build();
}
```

# Resources

- https://reference.wildfly-swarm.io/
- HTTP Config Options: https://reference.wildfly-swarm.io/fractions/undertow.html
