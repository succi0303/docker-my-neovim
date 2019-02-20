# My Neovim Dockerized

Neovim dockerized with my personal configuration.

## Requirements

- Docker for Mac

I use this on  macOS Mojave

## Usage

```bash
# Install
git clone https://github.com/succi0303/docker-my-neovim.git
cd docker-my-neovim
docker build -t nvim .

# Run
docker run -it --rm -v $(pwd):/usr/src/nvim nvim [filename]
```
