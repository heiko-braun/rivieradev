# Working with the plugin, customising build options

## Add fractions to the `pom.xml`

Same project as before (javaee7-simple-sample)

```
<dependency>
   <groupId>org.wildfly.swarm</groupId>
   <artifactId>jaxrs-jaxb</artifactId>
</dependency>
<dependency>
   <groupId>org.wildfly.swarm</groupId>
   <artifactId>cdi</artifactId>
</dependency>
<dependency>
   <groupId>org.wildfly.swarm</groupId>
   <artifactId>jpa</artifactId>
</dependency>                                                                                                             
```

## Look into content of uberJar

```
META-INF/wildfly-swarm-manifest.yaml
m2repo/...
_bootstrap/javaee7-simple-sample.war
```

## Hollow jars

Build an uberJar without a deployment
```
mvn clean -Dswarm.hollow=true package
java -jar target/*swarm.jar
```
 Leads to 

```
...
2017-04-27 16:40:19,367 ERROR [org.wildfly.swarm.deployer] (main) WFSDEPLOY0002: No deployments specified
2017-04-27 16:40:19,368 INFO  [org.wildfly.swarm] (main) WFSWARM99999: WildFly Swarm is Ready

```

But you can associate the deployment later on:

```
java -jar target/javaee7-simple-sample-hollow-swarm.jar target/javaee7-simple-sample.war
```
## Introduce wildfly-swarm:run / start/stop , etc
