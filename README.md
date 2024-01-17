<!--
 Copyright 2024 仲夏叶.
 SPDX-License-Identifier: MIT
-->

# TLDR Docker

[![ghcr.io/stornado/tldr:main](https://github.com/stornado/tldr/actions/workflows/docker-github-publish.yml/badge.svg)](https://github.com/stornado/tldr/actions/workflows/docker-github-publish.yml)
[![zxytech/tldr:main](https://github.com/stornado/tldr/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/stornado/tldr/actions/workflows/docker-publish.yml)
[![Docker Stars](https://img.shields.io/docker/stars/zxytech/tldr.svg)](https://hub.docker.com/r/zxytech/tldr/)
[![Docker Pulls](https://img.shields.io/docker/pulls/zxytech/tldr.svg)](https://hub.docker.com/r/zxytech/tldr/)
![GitHub License](https://img.shields.io/github/license/stornado/tldr)
![GitHub top language](https://img.shields.io/github/languages/top/stornado/tldr)
![Docker Image Size with architecture (latest by date/latest semver)](https://img.shields.io/docker/image-size/zxytech/tldr)

离线环境使用 Docker 运行 tldr

## Prepare

```bash
# 联网环境
docker pull zxytech/tldr:main
docker save --output tldr.tar zxytech/tldr:main

# 离线环境
docker load --input tldr.tar
```

## Usage

1. 方式1

```bash
docker run --name tldr --rm -ti zxytech/tldr:main ls
```

2. 方式2

```bash
# add to ~/.bashrc
echo "alias 'tldr=docker run --rm --name tldr --rm -ti zxytech/tldr:main'" >> $HOME/.bashrc

# use
tldr <command> # e.g. tldr ls
```

## License

MIT

## Raw repository

1. [tldr-pages/tldr: 📚 Collaborative cheatsheets for console commands](https://github.com/tldr-pages/tldr)
2. [tldr-pages/tlrc: A tldr client written in Rust](https://github.com/tldr-pages/tlrc)
