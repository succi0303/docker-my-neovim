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
    grep \
    linux-headers \
    musl-dev\
    neovim \
    python-dev \
    py-pip \
    python3-dev \
    py3-pip \
    ruby \
    ruby-dev \
    go && \
    rm -rf /var/cache/apk/*

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"

RUN pip3 install --upgrade pip neovim flake8 && \
    gem install --no-document etc json rubocop

RUN CGO_ENABLED = 0 GOOS=linux && \
    go get github.com/klauspost/asmfmt/cmd/asmfmt && \
    go get github.com/derekparker/delve/cmd/dlv && \
    go get github.com/kisielk/errcheck && \
    go get github.com/davidrjenni/reftools/cmd/fillstruct && \
    go get github.com/mdempsky/gocode && \
    go get github.com/stamblerre/gocode && \
    go get github.com/rogpeppe/godef && \
    go get github.com/zmb3/gogetdoc && \
    go get golang.org/x/tools/cmd/goimports && \
    go get golang.org/x/lint/golint && \
    go get github.com/alecthomas/gometalinter && \
    go get github.com/fatih/gomodifytags && \
    go get golang.org/x/tools/cmd/gorename && \
    go get github.com/jstemmer/gotags && \
    go get golang.org/x/tools/cmd/guru && \
    go get github.com/josharian/impl && \
    go get honnef.co/go/tools/cmd/keyify && \
    go get github.com/fatih/motion && \
    go get github.com/koron/iferr


RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .config /root/.config

RUN nvim +PlugInstall +qa

WORKDIR /usr/src/nvim

ENTRYPOINT ["nvim"]
