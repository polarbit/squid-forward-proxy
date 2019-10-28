#!/bin/bash

echo "Starting squid..."
exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
