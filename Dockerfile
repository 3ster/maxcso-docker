FROM alpine:edge AS builder

RUN apk add git make g++\
	libuv-static libuv-dev\
	zlib-static zlib-dev\
	lz4-static lz4-dev

RUN git clone https://github.com/unknownbrackets/maxcso build
WORKDIR /build
RUN sed -E -i "s|VERSION = \"(.*)\"|VERSION = \"\1-$(git rev-parse --short HEAD)\"|" src/compress.h
RUN CFLAGS="-static -s" make -j

FROM scratch
COPY --from=builder /build/maxcso /maxcso

ENTRYPOINT ["/maxcso"]

