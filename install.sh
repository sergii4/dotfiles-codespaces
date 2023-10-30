#!/usr/bin/env bash

set -o pipefail -o errtrace -o errexit -o nounset

[[ -n "${TRACE:-}" ]] && set -o xtrace

declare errmsg="ERROR (${0##*/})":
trap 'echo >&2 $errmsg trap on error \(rc=${PIPESTATUS[@]}\) near line $LINENO' ERR

mkdir -p ~/.config

[[ -d ~/.config/nvim ]] || ln -sf "$(pwd)/nvim" ~/.config/nvim
[[ -f ~/.auraprompt ]] || ln -s "$(pwd)/mpprompt" ~/.auraprompt
[[ -f ~/.bashrc ]] || ln -s "$(pwd)/bashrc" ~/.bashrc
[[ -f ~/.tmux.conf ]] || ln -s "$(pwd)/tmuxconf" ~/.tmux.conf
[[ -f ~/.kubectl-aliases ]] || ln -s "$(pwd)/kubectl-aliases" ~/.kubectl-aliases
[[ -f ~/.ak-aliases ]] || ln -s "$(pwd)/ak-aliases" ~/.ak-aliases

echo "installing fzf... "
if [[ ! -d "${HOME}/.fzf" ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf >/dev/null
  ~/.fzf/install --completion --key-bindings --no-update-rc
fi

printf "installing packer... "
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "ok"

codespace_pw="$(cat /workspaces/neo4j-cloud/.devcontainer/.codespace_pw)"
echo "${codespace_pw}" | sudo -S apt-get update

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

sudo apt-get install -y \
  htop \
  flake8 \
  silversearcher-ag \
  tmux \
  tree \
  neovim \
  --no-install-recommends

sudo rm -rf /var/lib/apt/lists/*

echo "Complete!"
