FROM golang:1.19.1-buster as go-target
ADD . /image2ascii
WORKDIR /image2ascii
RUN GOBIN=/image2ascii/ go install github.com/qeesung/image2ascii@latest

FROM golang:1.19.1-buster
COPY --from=go-target /image2ascii/image2ascii /
COPY --from=go-target /image2ascii/convert/testdata/*.jpg /testsuite/

ENTRYPOINT []
CMD ["/image2ascii", "-f", "@@"]
