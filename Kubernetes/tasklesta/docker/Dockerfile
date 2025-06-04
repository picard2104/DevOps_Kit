FROM golang:1.21.5 AS builder
WORKDIR /go-app
COPY go.mod go.sum ./
RUN go mod download
COPY cmd /go-app/cmd
COPY internal /go-app/internal
COPY docs /go-app/docs
RUN cd /go-app/cmd/demo && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /bin/go-app ./

FROM postgres:16.1-alpine3.19
COPY --from=builder /bin/go-app /bin/go-app
RUN chmod +x /bin/go-app
ENV API_PORT="8080"
ENV DB_URL="postgres://user:pass@postgres:5432/dbname"
CMD ["/bin/sh", "-c", "/bin/go-app"]
