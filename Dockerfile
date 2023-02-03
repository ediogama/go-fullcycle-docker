FROM golang:alpine AS builder

WORKDIR $GOPATH

COPY . .

RUN go build main.go

FROM scratch

COPY --from=builder /go/main /go/main

ENTRYPOINT [ "/go/main","bash" ]
