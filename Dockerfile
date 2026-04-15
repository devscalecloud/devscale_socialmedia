FROM golang:1.21-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o devscale-socialmedia .

RUN addgroup -S app && adduser -S app -G app

ENV PORT=8080

EXPOSE 8080

USER app

CMD ["./devscale-socialmedia"]

