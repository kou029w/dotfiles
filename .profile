[ -n "$BASH_VERSION" ] && . "$HOME/.bashrc"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME"/.nix-profile/etc/profile.d/nix.sh
export DENO_INSTALL_ROOT="${HOME}/.local"
export GOPATH="${HOME}/.local"
export PATH="$HOME/.local/bin:$PATH"
