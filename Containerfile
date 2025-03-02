FROM debian:bookworm

RUN apt update
RUN apt install -y golang make ca-certificates curl

COPY . api-samsungtv-master/
RUN cd api-samsungtv-master && go get github.com/jmoiron/jsonq && make go-build
RUN strip ./api-samsungtv-master/bin/api-samsungtv

COPY configs/test.yml api-samsungtv.yml

EXPOSE 8080

CMD ["./api-samsungtv-master/bin/api-samsungtv", "--port", "8080", "-c", "api-samsungtv.yml"]
