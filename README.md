Go Compiledaemon
===

This docker image mounts a local volume and runs a continuous build on it using CompileDaemon

Designed and tested on Linux for use with docker compose

## Usage

```bash
docker run klumhru/golang-compiledaemon -v (your project root):/go/src/(your project path)
```
