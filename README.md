# squid-forward-proxy

Some key features:
* Only allowes access to domains specifies in the `squid.whitelist` file.
* Basic http authentication is builtin. And users can be added later. (Container restart is required.)
* You can change `squid.conf` file for your custome settings.  (Container restart is required.)


**See Resources:**
* [Alpine - Setting up Explicit Squid Proxy](https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy)
* [Alpine Linux Docker Image](https://hub.docker.com/_/alpine)
* [Access Controls in Squid](https://wiki.squid-cache.org/SquidFaq/SquidAcl)
* [How Squid ACLs work](https://workaround.org/squid-acls)


### Create Users
```
sudo apt install apache2-utils

# 1st user
sudo htpasswd -cb squid.passwords ${SQUIDUSERNAME} ${SQUIDPASSWORD}

# Other users
sudo htpasswd -b squid.passwords ${SQUIDUSERNAME2} ${SQUIDPASSWORD2}  
```

> If htpasswd is not installed yet, install it first.
>
> `sudo apt install apache2-utils`

### Build and Run Docker Container

```
# Build container image
docker build -t safakulusoy/squid-forward-proxy .

# Run container
docker run -it --name squid -d --restart=always --publish 3128:3128 \
--volume ${PWD}/squid.conf:/etc/squid/squid.conf \
--volume ${PWD}/squid.whitelist:/etc/squid/squid.whitelist \
--volume ${PWD}/squid.passwords:/etc/squid/squid.passwords \
safakulusoy/squid-forward-proxy:latest

# See Squid logs
docker exec -it squid tail -f /var/log/squid/access.log

# Squid bash
docker exec -it squid bash
```


### Test
```
wget http://postman-echo.com/get?name=safak -e use_proxy=yes -e http_proxy=http://${SQUIDUSERNAME}:${SQUIDPASSWORD}@localhost:3128
```


