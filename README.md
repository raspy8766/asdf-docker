# ASDF Docker

A base Docker Image for ASDF

## Basics

This Docker image is intended to be used as a base image. You can then create a light-weight Docker image to extend and customize it further by adding more utilities (e.g. `apt-get`), and most importantly define and install `asdf` plugins.

The [Dockerfile.example](.devcontainer/Dockerfile.example) is a good reference on how to do this, as well as how to use a [.tool-versions](.devcontainer/.tool-versions) file for consistent version management.

## Dev Container

To provide a consistent IDE experience, you can also use your Docker image in a `devcontainer.json` configuration file. This enables support for both [Dev Container](https://code.visualstudio.com/docs/devcontainers/containers) and [GitHub Codespaces](https://github.com/features/codespaces).
