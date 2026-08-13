#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ln -sfn "$DIR" ~/.dotfiles

configure_linux_login_shell() {
  local zsh_path="$HOME/.nix-profile/bin/zsh"
  local current_user
  local current_shell

  if [[ ! -x "$zsh_path" ]]; then
    echo "Home Manager did not install Zsh at $zsh_path" >&2
    return 1
  fi

  current_user="$(id -un)"
  if ! current_shell="$(getent passwd "$current_user" | cut -d: -f7)" || [[ -z "$current_shell" ]]; then
    echo "Could not determine the login shell for $current_user" >&2
    return 1
  fi

  if [[ "$current_shell" == */zsh ]]; then
    return
  fi

  if ! grep -qxF -- "$zsh_path" /etc/shells; then
    printf '%s\n' "$zsh_path" | sudo tee -a /etc/shells >/dev/null
  fi

  sudo chsh -s "$zsh_path" "$current_user"
  echo "Set the login shell for $current_user to $zsh_path. It will be used by the next SSH session."
}

case "$(uname -s)" in
  Darwin)
    exec sudo darwin-rebuild switch --flake ~/.dotfiles#pooter
    ;;
  Linux)
    nix run ~/.dotfiles#parrot
    configure_linux_login_shell
    ;;
  *)
    echo "Unsupported operating system: $(uname -s)" >&2
    exit 1
    ;;
esac
