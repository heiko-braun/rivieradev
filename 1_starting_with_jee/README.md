# Instructions

## Clone the sample app

```
git clone https://github.com/javaee-samples/javaee7-simple-sample.git
```

## Add the Swarm Plugin
```
forge 
addon-install-from-git --url https://github.com/forge/wildfly-swarm-addon.git
wildfly-swarm-setup
wildfly-swarm-add-fraction --fractions
```

## Start the service

```
java -jar target/*-swarm.jar
```

## Poke into it

```
curl -v http://localhost:8080/resources/persons | xmllint --format -
```

# Resources

- https://github.com/forge/wildfly-swarm-addon
- https://forge.jboss.org/download


