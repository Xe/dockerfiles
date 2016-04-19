FROM alpine:edge

ENV TERRAFORM_VERSION v0.6.14

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk update; apk upgrade && \
  apk add curl make git go gcc musl-dev openssl-dev && \
  mkdir /go && \
  export GOPATH=/go && \
  go get -u -v -tags ${TERRAFORM_VERSION} github.com/hashicorp/terraform/... && \
  go get -u -v -tags ${TERRAFORM_VERSION} github.com/hex-sh/terraform-provider-scaleway/... && \
  go get -u -v -tags ${TERRAFORM_VERSION} github.com/jonmorehouse/terraform-provisioner-ansible/... && \
  echo "terraform built" && \
  mv /go/bin/terraform* /usr/local/bin && \
  (for file in /go/bin/*; do if [[ $file != 'terraform*' ]]; then mv $file /go/bin/terraform-$(basename $file); fi; done) && \
  mv /go/bin/* /usr/local/bin && \
  rm -rf /go && \
  apk del make git go gcc musl-dev openssl-dev && \
  rm -rf /var/cache/apk/*

CMD /usr/local/bin/terraform
