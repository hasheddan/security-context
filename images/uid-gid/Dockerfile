FROM golang:1.14

WORKDIR /server

COPY go.mod .
COPY main.go .

# Install the package
RUN go build -o server

# This container exposes port 8080 to the outside world
EXPOSE 8080

RUN groupadd --gid 1000 mygroup && useradd -g mygroup 1000 
USER 1000
# Run the executable
CMD ["./server"]