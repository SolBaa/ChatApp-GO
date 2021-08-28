FROM golang:1.16-alpine

RUN mkdir /app
## We copy everything in the root directory
## into our /app directory
ADD . /app
WORKDIR /app

# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o main .

EXPOSE 8080

CMD [ "/app/main" ]