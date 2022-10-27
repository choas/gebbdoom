# docker build -t choas/gebb .
# docker run --volume $PWD:/build choas/gebb

FROM ubuntu:22.10

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    inkscape texlive texlive-font-utils texlive-latex-extra golang \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /build
VOLUME [ "/build" ]
WORKDIR /build

CMD ./make.sh
