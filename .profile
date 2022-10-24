export EDITOR=nano
export PATH="$HOME/.local/bin:$PATH"
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
export DENO_INSTALL_ROOT="${HOME}/.local"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -n "$BASH_VERSION" ] && . "$HOME/.bashrc"
