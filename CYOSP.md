# Update swagger generated code
```
podman build -t api-samsungtv-swagger-update -f - . <<EOF
FROM ghcr.io/go-swagger/go-swagger
RUN apk add make
ENTRYPOINT make swagger-gen
EOF

podman run --rm -it --user $(id -u):$(id -g) -v $PWD:/working-directory -w /working-directory localhost/api-samsungtv-swagger-update
```

# Build
```
podman build --tag localhost/samsung:latest .
```

# Run
```
podman run --rm -p 8080:8080 localhost/samsung:latest
```

# Test
```
wget 127.0.0.1:8080/status
curl -X POST 127.0.0.1:8080/power/on
curl -X POST 127.0.0.1:8080/key/VOLUP
curl -X POST 127.0.0.1:8080/app/3201907018807
curl -X POST 127.0.0.1:8080/power/off
```
