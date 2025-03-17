FROM debian:bookworm

RUN apt update
RUN apt install -y golang make ca-certificates curl

COPY . api-samsungtv-master/
WORKDIR "api-samsungtv-master"
RUN go get github.com/jmoiron/jsonq
RUN make go-build
RUN strip ./bin/api-samsungtv

COPY configs/test.yml api-samsungtv.yml

EXPOSE 8080

CMD ["./bin/api-samsungtv", "--port", "8080", "-c", "api-samsungtv.yml"]
