# Gmalite-pottyos docker build

Concepts:
- "existing" base images
- multi-stage build with `COPY --from=build / /`
- distroless "code" image


You can build the images locally, w/o CI:

```
./build.sh
```

Start the images with compose

```
docker-compose up
```

