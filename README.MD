# mullvad-socks-docker

Expose the Mullvad SOCKS5 proxy through docker.

```bash
docker run \
  --name mullvad \
  -e PRIVATE_KEY= \
  -e ADDRESS= \
  -e PUBLIC_KEY= \
  -e ENDPOINT= \
  --cap-add NET_ADMIN \
  -p localhost:1080:1080 \
  mullvad-socks-docker
```

The flag `--cap-add NET_ADMIN` is required and `-p localhost:1080:1080` exposes the socks5 proxy on `localhost:1080`

Fill in the environment variables with the values found in the Mullvad provided WireGuard config file.

Optional environment variables
- `DNS` - Defaults to `10.64.0.1`
- `PROXY_ADDR` - Defaults to `10.64.0.1`
- `PROXY_PORT` - Defaults to `1080`. This does not change the port exposed from the container.
