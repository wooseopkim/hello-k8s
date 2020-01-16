FROM golang

WORKDIR /var/app

COPY go.* ./
RUN go mod download

COPY . .

CMD ["go", "run", "cmd/main.go"]
