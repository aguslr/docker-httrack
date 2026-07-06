[aguslr/docker-httrack][1]
==========================

[![docker-pulls](https://img.shields.io/docker/pulls/aguslr/httrack)](https://hub.docker.com/r/aguslr/httrack) [![image-size](https://img.shields.io/docker/image-size/aguslr/httrack/latest)](https://hub.docker.com/r/aguslr/httrack)


This *Docker* image sets up [HTTrack][2] inside a docker container.

> **[HTTrack][2]** is a free (GPL, libre/free software) and easy-to-use offline
> browser utility.


Installation
------------

To use *docker-httrack*, follow these steps:

1. Clone and start the container:

       docker run -p 8080:8080 \
         -e DATA=/data \
         -v "${PWD}"/data:/data \
         docker.io/aguslr/httrack:latest

2. Configure your Web browser to connect to *HTTrack*'s web interface with
   `http://localhost:8080`


### Variables

The image is configured using environment variables passed at runtime:

| Variable  | Function                            | Default          | Required |
| :-------- | :---------------------------------- | :--------------- | -------- |
| `PUID`    | UID for the user to run the command | `root`           | N        |
| `PGID`    | GID for the user to run the command | `root`           | N        |
| `DATA`    | Path for mirror/logfiles+cache      | `/root/websites` | N        |
| `PORT`    | Port for the server to listen on    | 8080             | N        |


Build locally
-------------

Instead of pulling the image from a remote repository, you can build it locally:

1. Clone the repository:

       git clone https://github.com/aguslr/docker-httrack.git

2. Change into the newly created directory and use `docker-compose` to build and
   launch the container:

       cd docker-httrack && docker-compose up --build -d


[1]: https://github.com/aguslr/docker-httrack
[2]: https://www.httrack.com/
