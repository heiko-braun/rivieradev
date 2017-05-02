# API Descriptions

## Swagger

The fraction:
```
<dependency>
    <groupId>org.wildfly.swarm</groupId>
    <artifactId>swagger</artifactId>
</dependency>

<dependency>
    <groupId>org.wildfly.swarm</groupId>
    <artifactId>swagger-webapp</artifactId>
</dependency>
```

and the meta data:

`META-INF/swarm.swagger.conf`

```
title: Java EE 7 Sample
root: resources
```

```
@Path("persons")
@Advertise("person-service")
@Api(description = "person resources", tags = "person")
public class PersonResource {

    @GET
    @Produces("application/xml")
    @ApiOperation(value = "Retrieve all person resources",
            notes = "Returns a collection",
            response = Person.class
    )
    public Person[] get() {
        ...
    }

}
```
## Take a look at the meta data

```

curl http://localhost:8080/resources/swagger.json

{
    "basePath": "/resources",
    "definitions": {
        "Person": {
            "properties": {
                "name": {
                    "type": "string"
                }
            },
            "type": "object"
        }
    },
    "info": {
        "title": "Java EE 7 Sample"
    },
    "paths": {
        "/persons": {
            "get": {
                "description": "Returns a collection",
                "operationId": "get",
                "parameters": [],
                "produces": [
                    "application/xml"
                ],
                "responses": {
                    "200": {
                        "description": "successful operation",
                        "schema": {
                            "$ref": "#/definitions/Person"
                        }
                    }
                },
                "summary": "Retrieve all person resources",
                "tags": [
                    "person"
                ]
            }
        },
        "/persons/logger/level": {
            "get": {
                "operationId": "getLogLevel",
                "parameters": [],
                "responses": {
                    "default": {
                        "description": "successful operation"
                    }
                },
                "tags": [
                    "person"
                ]
            }
        },
        "/persons/{id}": {
            "get": {
                "operationId": "get",
                "parameters": [
                    {
                        "format": "int32",
                        "in": "path",
                        "name": "id",
                        "required": true,
                        "type": "integer"
                    }
                ],
                "responses": {
                    "200": {
                        "description": "successful operation",
                        "headers": {},
                        "schema": {
                            "$ref": "#/definitions/Person"
                        }
                    }
                },
                "tags": [
                    "person"
                ]
            }
        }
    },
    "swagger": "2.0",
    "tags": [
        {
            "name": "person"
        }
    ]
}

```

## Alternatively, use the UI

http://localhost:8080/swagger-ui
