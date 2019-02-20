FROM alpine:edge

LABEL maintainer="succi0303@gmail.com"

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    build-base \
    curl \
    gcc \
    git \
    go \
    grep \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl-dev\
    neovim \
    nodejs \
    nodejs-npm \
    python-dev \
    py-pip \
    python3-dev \
    py3-pip \
    ruby \
    ruby-dev && \
    rm -rf /var/cache/apk/*

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8" \
    PATH=$PATH:/root/go/bin

RUN pip3 install --upgrade pip neovim flake8 autopep8 && \
    gem install --no-document etc json rubocop solargraph && \
    npm install --global eslint prettier

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .config /root/.config

COPY .eslintrc.json /root/.eslintrc.json

RUN nvim +PlugInstall +qall

RUN nvim -c "execute 'silent GoInstallBinaries' | execute 'quit'"

WORKDIR /usr/src/nvim

ENTRYPOINT ["nvim"]
