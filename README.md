## Dockerfile: Debian - Selenium

[![Build Status](https://travis-ci.org/ericmdev/selenium.dockerfile.svg?branch=master)](https://travis-ci.org/ericmdev/selenium.dockerfile)

**Dockerfile** of [Debian](https://www.debian.org/) Selenium:

- selenium
- firefox
- google-chrome-beta
- xvfb

*Requirements*
- [Docker](https://www.docker.com/) 

*Base Docker Image*
- [java:openjdk-8](https://hub.docker.com/_/java/)

*Docker Pull Command*
- `docker pull ericmdev/selenium`

### Usage

Build the image.

    $ make

Run the container.

    $ make run

Dig into the container.

    $ make exec

*See the `Makefile` for more options.