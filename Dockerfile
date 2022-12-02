FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y curl git gcc make rlwrap

WORKDIR /advent

RUN git clone https://github.com/kevinlawler/kona.git && cd kona && make

ENV PATH="$PATH:/advent/kona"

CMD ["k"]
