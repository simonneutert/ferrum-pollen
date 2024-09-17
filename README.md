# Ferrum-Pollen

Grab the Pollen as a screenshot from "https://allergie.hexal.de/pollenflug/vorhersage".

Then saves the screenshot as a file and updates the index.html file, for easy handout via a webserver of choice.

## Docker

### Build

```sh
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t pollen .
# OR
$ docker buildx build -t pollen .
```

### Run

```sh
# Pass your "Postleitzahl" as an environment variable and mount your local directory as a volume
# to save the screenshot and update the index.html file on your local machine.
$ docker run --env PLZ='55218' --rm -v ${PWD}:/app -w /app pollen
```
