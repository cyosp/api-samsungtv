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
curl -X POST 127.0.0.1:8080/power/off
```
