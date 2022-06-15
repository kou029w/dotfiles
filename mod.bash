function install_dotfiles() {
  local home
  local dotfile
  home=$(eval "echo ~${SUDO_USER:-}")
  for dotfile in .*; do
    [[ $dotfile =~ ^(\.\.?|\.git)$ ]] && continue

    dotfile=$(realpath "$dotfile")
    (
      cd -- "$home"
      ln -svf "$dotfile" .
    )
  done
}

function install_apt_packages() {
  local packages
  local apt_sources_dir
  . packages.bash
  eval "$(apt-config shell apt_sources_dir 'Dir::Etc::sourceparts/d')"
  rsync -rv etc/apt/keyrings/ /usr/share/keyrings/
  rsync -rv etc/apt/sources.list.d/ "$apt_sources_dir"
  [[ -d etc/default ]] \
    && rsync -rv etc/default/ /etc/default/
  apt update
  apt install -y "${packages[@]}"
  rsync -rv etc/apt/sources.list.d/ "$apt_sources_dir"
}

function install_homebrew_packages() {
  local uid
  uid=${SUDO_UID:-$(id -u)}
  sudo --user="#$uid" \
    NONINTERACTIVE=1 \
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  sudo --user="#$uid" \
    /home/linuxbrew/.linuxbrew/bin/brew bundle --file=.Brewfile
}

function install_addons() {
  local addon
  for addon in "$@"; do
    (
      cd -- "$addon"
      ./install
    )
  done
}
