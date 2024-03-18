# Docker container for UMIcollapse

Dockerfile for [UMIcollapse](https://github.com/Daniel-Liu-c0deb0t/UMICollapse).

It's on [dockerhub](https://hub.docker.com/r/naotokubota/umicollapse) and [github](https://github.com/NaotoKubota/umicollapse).

## tags and links

- `1.0.0` [(master/Dockerfile)](https://github.com/NaotoKubota/umicollapse/blob/master/Dockerfile)

## how to build

```sh
docker pull naotokubota/umicollapse:1.0.0
```

or

```sh
git clone git@github.com:NaotoKubota/umicollapse.git
cd umicollapse
docker build --rm -t naotokubota/umicollapse:1.0.0 .
```

## running

```sh
docker run --rm -it naotokubota/umicollapse:1.0.0 bash
```
