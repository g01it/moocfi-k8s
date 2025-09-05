# UUIDShower

## Prerequisites
- Docker
- Makefile
- Golang 1.23.4
- K3d (with a cluster)
- Kubectl (configured with K3d cluster)

## Building and Deploying
- You can compile the binary using the `make build` command. Build process is not containerized now.
- You can build and deploy to K3d using the command `make deploy`.
