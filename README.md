# squid-forward-proxy

**See Resources:**
* [Alpine - Setting up Explicit Squid Proxy](https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy)
* [Alpine Linux Docker Image](https://hub.docker.com/_/alpine)
* [Access Controls in Squid](https://wiki.squid-cache.org/SquidFaq/SquidAcl)
* (http://soad1982.blogspot.com/2013/05/squid-proxy-on-aws.html)


## Docker

```
# Build container image
docker build -t safakulusoy/squid-forward-proxy .

# Run container
docker run -it --name squid -d --restart=always --publish 3128:3128 \
--volume ${PWD}/squid.whitelist:/etc/squid/squid.whitelist \
safakulusoy/squid-forward-proxy:latest

# See Squid logs
docker exec -it squid tail -f /var/log/squid/access.log

# Squid bash
docker exec -it squid bash
```


## Create Users
```
sudo apt install apache2-utils

# 1st user
sudo htpasswd -cb squid.passwords ${SQUIDUSERNAME} ${SQUIDPASSWORD}

# Other users
sudo htpasswd -b squid.passwords ${SQUIDUSERNAME2} ${SQUIDPASSWORD2}  
```


## Test
```
wget http://postman-echo.com/get?name=safak -e use_proxy=yes -e http_proxy=http://${SQUIDUSERNAME}:${SQUIDPASSWORD}@localhost:3128
```

Temporary Documents
* [Install Docker to Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
