# CS 300: development environment

This repo contains a minimal dev environment setup for CS 300. In
particular, it provides the scripts to create the course Docker
container.

## Getting started

```
# 1. Download the container image
cd docker
./cs300-setup-docker

# 2. start development environment
cd ..
./cs300-run-docker
```

For detailed setup instructions, refer to our Lab 0 setup guide!

For a reference on how to run the container environment, see
`./cs300-run-docker help`.


## Acknowledgements

This setup is a modified version of the setup used by
[Harvard's CS61](https://cs61.seas.harvard.edu/site/2021/) and reused
with permission.
