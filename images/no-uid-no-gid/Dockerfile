FROM golang:1.14

WORKDIR /server

COPY go.mod .
COPY main.go .

# Install the package
RUN go build -o server

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["./server"]