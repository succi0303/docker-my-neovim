# My Neovim Dockerized

Neovim dockerized with my personal configuration.

## Requirements

- Docker for Mac

I use this on MacBook / macOS High Sierra

## Usage

```bash
# Install
git clone https://github.com/succi0303/my-neovim-dockerized.git
cd my-neovim-dockerized
docker build -t nvim .

# Run
docker run -it --rm -v $(pwd):/usr/src/nvim nvim [filename]
```
