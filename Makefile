all: server client 

server:
	@echo "build Server"
	go build -o cmd/bin/server cmd/server/server.go

client:
	@echo "build Client"
	go build -o cmd/bin/client cmd/client/client.go
