# What is this

Simple, efficient Ubuntu (20.04) with latest Go installed

# Build arguments

It is possible to change the version downloaded for the Go by using build arguments.

``` bash
docker build --rm --compress --build-arg GOVERSION=1.14.9 -t go:1.14.9 .
```

Please remember to update the tag with it, so you can fetch it from your local Docker registry, easily.
