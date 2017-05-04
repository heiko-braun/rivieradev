# Moving service into the cloud

```
http://launch.openshift.io
```

or use a local cluster:

```
minishift console
```


## Let's look at a booster

It basically adds a maven plugin

```
<build>
  <plugins>
    <plugin>
      <groupId>io.fabric8</groupId>
      <artifactId>fabric8-maven-plugin</artifactId>
      <executions>
        <execution>
          <goals>
            <goal>resource</goal>
            <goal>build</goal>
          </goals>
        </execution>
      </executions>    
    </plugin>
  </plugins>
</build>
```

## Service meta data

i.e. route

```
apiVersion: v1
kind: Route
metadata:
  name: ${project.artifactId}
spec:
  port:
    targetPort: 8080
  to:
    kind: Service
    name: ${project.artifactId}
```

and service

```
apiVersion: v1
kind: Service
metadata:
  name: ${project.artifactId}
spec:
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
  type: ClusterIP

```

## Deployments are as simple as running maven commands

```
oc project

Using project "myproject" on server "https://192.168.64.3:8443".

```

and deployment using a source2image builder within openshift:
```
mvn fabric8:deploy
```

## Poke into the service runnning on openshift

```
	http://wfswarm-health-check-myproject.192.168.64.3.nip.io
```

Take a look at routes, services, deployments, liveness, etc (basic openshift concepts)
