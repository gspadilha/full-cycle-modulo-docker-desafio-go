FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go

# The scratch image is the smallest possible image for docker
FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080

ENTRYPOINT ["/main"]
