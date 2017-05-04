
# Service health a cloud systems

## Chose a starting point

```
https://github.com/wildfly-swarm-openshiftio-boosters
```

i.e. health check

```
@GET
@Health
@Path("/health")
public HealthStatus check() {
 ...  
 return HealthStatus.named("server-state").up();

}
```

you can poke into it:

```
curl http://localhost:8080/health

{
    "checks": [
        {
            "id": "server-state",
            "result": "UP"
        }
    ],
    "outcome": "UP"
}
```

It's actually an implementation of https://github.com/eclipse/microprofile-evolution-process/blob/master/proposals/0003-health-checks.md


## Install the service into openshift

```
mvn -Popenshift fabric8:deploy
```

Take a look at the deployment meta data (readiness and liveness checks declared)

Terminate the process and watch it failover

```
oc logs -f <POD_NAME>
curl http://wfswarm-health-check-myproject.192.168.64.3.nip.io/api/killme
```

- Watch service shutdown
- Demonstrate non-readiness, while being restarted
- Watch service come back up
