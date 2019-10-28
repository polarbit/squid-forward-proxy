# squid-forward-proxy

**See Resources:**
* [Alpine - Setting up Explicit Squid Proxy](https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy)
* [Alpine Linux Docker Image](https://hub.docker.com/_/alpine)
* [Access Controls in Squid](https://wiki.squid-cache.org/SquidFaq/SquidAcl)
* (http://soad1982.blogspot.com/2013/05/squid-proxy-on-aws.html)

## Create User

sudo htpasswd /etc/squid3/passwd ${USERNAME}

sudo systemctl restart squid

docker run --name squid -d --restart=always \
  --publish 3128:3128 \
  --volume /path/to/squid.whitelist:/etc/squid/squid.whitelist \
  safakulusoy/squid-forward-proxy:latest

See Squid Logs
docker exec -it squid tail -f /var/log/squid/access.log

Squid Bash
docker exec -it squid bash

Temporary Documents
* [Install Docker to Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
