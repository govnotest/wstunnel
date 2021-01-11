# wstunnel
Tunneling SOCKS5 proxy over Websockets.

This project contains two binaries: client and server.  
Running them in tandem creates a tunnel over Websocket protocol that proxies any information.

## Example

./cmd/bin/server  --http_port 80 start server on 80 port

./cmd/bin/client --target_host="127.0.0.1:80" start client on 8080 port and connect to 127.0.0.1:80 for Websockets
