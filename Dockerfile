FROM ubuntu:latest

LABEL maintainer="succi0303@gmail.com"

RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:neovim-ppa/stable && \
    apt-add-repository -y ppa:longsleep/golang-backports && \
    apt-get update -y && \
    apt-get install -y \
    curl \
    git \
    language-pack-ja-base \
    language-pack-ja \
    neovim \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    build-essential \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    golang-go \
    nodejs \
    npm

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8" \
    GOPATH=/root/go PATH=$PATH:/root/go/bin

RUN pip3 install --upgrade pip neovim flake8 autopep8 python-language-server && \
    gem install --no-document etc json rubocop solargraph && \
    npm install --global eslint prettier typescript typescript-language-server && \
    go get golang.org/x/tools/golint && \
    go get golang.org/x/tools/cmd/gopls

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .config /root/.config

COPY .eslintrc.json /root/.eslintrc.json

RUN nvim +PlugInstall +qall

WORKDIR /root/go/src/nvim

ENTRYPOINT ["nvim"]
