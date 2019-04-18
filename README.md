# imagecoin-docker
Dockerfile for ImageCoin (<https://github.com/mceme/ImageCoin>)


# Building

```bash
docker build -t imagecoin .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir data
docker run --rm -itd --name iimg -p 6999:6999 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf imagecoin
```

# Using pre-built docker image

```bash
docker run --rm -itd --name iimg -p 6999:6999 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/imagecoin:latest
```
