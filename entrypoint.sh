#!/bin/bash
cd /etc/wireguard

ADDRESS=$(echo $ADDRESS | cut -d ',' -f 1)
PROXY="${PROXY_ADDR:=10.64.0.1}:${PROXY_PORT:=1080}"

echo "[Interface]" > wg0.conf
echo "PrivateKey = $PRIVATE_KEY" >> wg0.conf
echo "Address = $ADDRESS" >> wg0.conf
echo "DNS = ${DNS:=10.64.0.1}" >> wg0.conf

echo "[Peer]" >> wg0.conf
echo "PublicKey = $PUBLIC_KEY" >> wg0.conf
echo "AllowedIPs = $PROXY_ADDR/32" >> wg0.conf
echo "Endpoint = $ENDPOINT" >> wg0.conf

wg-quick up wg0

if ! ping -Ac 3 $PROXY_ADDR > /dev/null; then
  echo "Cannot reach mullvad socks5"
  exit 1
fi

socat TCP-LISTEN:1080,fork TCP:$PROXY

