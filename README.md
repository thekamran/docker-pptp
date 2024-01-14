# VPN (PPTP) for Docker

This is a docker image with simple VPN (PPTP) server with _chap-secrets_ authentication.

PPTP uses _/etc/ppp/chap-secrets_ file to authenticate VPN users.
You need to create this file on your own and link it to docker when starting a container.

Example of _chap-secrets_ file:

````
# Secrets for authentication using PAP
# client    server      secret      acceptable local IP addresses
username    *           password    *
````


## Starting VPN server

To start VPN server as a docker container run:

````
docker build -t docker-pptp .
docker run -d --privileged --name pptp --net host -v $(pwd)/chap-secrets:/etc/ppp/chap-secrets docker-pptp
````

Edit your local _chap-secrets_ file, to add or modify VPN users whenever you need.
When adding new users to _chap-secrets_ file, you don't need to restart Docker container.


