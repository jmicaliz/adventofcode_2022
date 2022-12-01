FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y curl git

ENV NONINTERACTIVE=1

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

RUN apt-get install -y build-essential

RUN brew install gcc && brew install kona
