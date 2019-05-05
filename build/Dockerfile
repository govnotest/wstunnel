# Build the manager binary
FROM golang:1.11.4 as builder

# Copy in the go src
WORKDIR /go/src/github.com/kubeway/wstunnel/
COPY cmd/   cmd/
#COPY pkg/    pkg/
COPY vendor/ vendor/

# Build
RUN mkdir -p cmd/bin/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o cmd/bin/server github.com/kubeway/wstunnel/cmd/server
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o cmd/bin/client github.com/kubeway/wstunnel/cmd/client

#FROM registry.cn-beijing.aliyuncs.com/knative-sample/centos:7.6.1810
FROM alpine:3.9.3
WORKDIR /app/
RUN mkdir -p /app/bin/
COPY --from=builder /go/src/github.com/kubeway/wstunnel/cmd/bin/server /app/bin/server
COPY --from=builder /go/src/github.com/kubeway/wstunnel/cmd/bin/client /app/bin/client
ENTRYPOINT ["/app/bin/server", "--http_port", "8080"]

