#!/bin/bash

exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
