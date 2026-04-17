FROM golang:1.21-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o socialmedia .

RUN addgroup -S socialmedia && adduser -S socialmedia -G socialmedia

FROM alpine:latest

WORKDIR /devscale_socialmedia

COPY --from=0 /app/templates ./templates

EXPOSE 8085

CMD ["./socialmedia"]