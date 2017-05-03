# Securing service access

## Keycloak server

```
docker run jboss/keycloak
docker run -d -p 9095:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin jboss/keycloak
```

Verify it runs correctly:
```
http://localhost:9095/
```

## Keycloak fraction

```
<dependency>
  <groupId>org.wildfly.swarm</groupId>
  <artifactId>keycloak</artifactId>
</dependency>
```

## Security constraints
```
swarm:
  deployment:
    javaee7-simple-sample.war:
      web:
        login-config:
          auth-method: KEYCLOAK
        security-constraints:
          - url-pattern: /resources/*
            methods: [GET]
            roles: [admin]          
```

```
curl http://localhost:8080/resources -v
HTTP/1.1 401 Unauthorized
```

## Retrieve a bearer token

```
source ./token.sh
```

```
eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJVbExaSHAwTEpreF9seGc4ZXl4QktkYS1YQURTUy1nMHctN2M2bGtCTmY4In0.eyJqdGkiOiI0NDNkMmEzNS0xMGE4LTQ1NWQtOWE3MC04M2I2ODRiZjc0ODYiLCJleHAiOjE0OTM3OTY0NzAsIm5iZiI6MCwiaWF0IjoxNDkzNzk2MTcwLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjkwOTUvYXV0aC9yZWFsbXMvUml2aWVyYURldiIsImF1ZCI6ImN1cmwiLCJzdWIiOiJhNGUwNmNjYy0wNDE4LTRmYTEtYmFlNS1lZDg2MTliMjdiMGQiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJjdXJsIiwiYXV0aF90aW1lIjowLCJzZXNzaW9uX3N0YXRlIjoiZmZhYjliODQtYmQ3NC00YmRjLWI4ZGUtNzdjZmU2MmFmNTgyIiwiYWNyIjoiMSIsImNsaWVudF9zZXNzaW9uIjoiODU5OGJmNWUtZjc3MC00OTNhLWI5N2YtM2YzYTk1Y2FlNDQ5IiwiYWxsb3dlZC1vcmlnaW5zIjpbXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwibmFtZSI6IiIsInByZWZlcnJlZF91c2VybmFtZSI6ImFsaWNlIn0.MkQCRS4gsC_dnJHd-ISmprIvoYQYSTtbXQPHAdhoBg4QXn0zrB_msPiPCtwQFpJZjyJK_QbYtB3diSJ_eUrq89rlE9FrmwpwLkkA7vF0mMLqCDquK_1p9iED4D1_M9bLwYRocZ_Vhd-thezRSb4hwqeZ2k6o2RMRbeN59fQKU3e76iNKMqf_DDln2Dz7S0uukIvge35HzRKqIcBHLuu6Ho6nXR-ERflsa2553iNLxb8xczdTZbTrahh-kGZcjAp9vwbB8nMy6sTftFz3VquW7eOAMtBjciwAdNK8dChx2xEtZg9LlwoA9uVYZJ1YDEW1DMXx7Bym67Tcx3u2zh3eSA
```

## Authenticated access to service

``` sh
curl -H "Authorization: bearer $TOKEN" http://localhost:8080/resources/persons
```
