# Ferrum-Pollen

Grab the Pollen as a screenshot from "https://allergie.hexal.de/pollenflug/vorhersage".

## Build

```sh
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t pollen .
```

## Run

```sh
$ docker run --env PLZ='74072' --rm -v ${PWD}:/app -w /app pollen
```
