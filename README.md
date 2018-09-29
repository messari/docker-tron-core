# messari/tron-core

A Tron Core (java-tron) docker image.

[![messari/tron-core][docker-pulls-image]][docker-hub-url] [![messari/tron-core][docker-stars-image]][docker-hub-url] [![messari/tron-core][docker-size-image]][docker-hub-url] [![messari/tron-core][docker-layers-image]][docker-hub-url]

## Tags

- `Odyssey-v3.1.1`, `latest` ([Odyssey-v3.1.1/Dockerfile](https://github.com/messari/docker-tron-core/blob/master/Odyssey-v3.1.1/Dockerfile))

## What is Tron Core?

Tron Core is the Tron Blockchain reference client and contains all the protocol rules required for the Tron network to function. Learn more about [Tron Core](https://github.com/tronprotocol/java-tron/).

## Usage

```
docker run -p18888:18888 -p8090:8090 -e TRON_DATA=/data -v $(pwd)/data:/data --rm tron
```

#### Mainnet

- JSON-RPC/REST: 8090
- P2P: 18888

## License

The [messari/tron-core][docker-hub-url] docker project is under MIT license.

[docker-hub-url]: https://hub.docker.com/r/messari/tron-core
[docker-layers-image]: https://img.shields.io/imagelayers/layers/messari/tron-core/latest.svg?style=flat-square
[docker-pulls-image]: https://img.shields.io/docker/pulls/messari/tron-core.svg?style=flat-square
[docker-size-image]: https://img.shields.io/imagelayers/image-size/messari/tron-core/latest.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/messari/tron-core.svg?style=flat-square
