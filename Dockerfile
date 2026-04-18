FROM golang:1.21-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o app .

EXPOSE 8085

# DevScale assignment fix
CMD ["./app"]
