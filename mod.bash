function install_dotfiles() {
  local home
  local dotfile
  home=$(eval "echo ~${SUDO_USER:-}")
  for dotfile in .*; do
    [[ $dotfile =~ ^(\.\.?|\.git)$ ]] && continue

    dotfile=$(realpath "$dotfile")
    (
      cd -- "$home" || exit 1
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
  [[ -d etc/default ]] &&
    rsync -rv etc/default/ /etc/default/
  apt update
  apt install -y "${packages[@]}"
  rsync -rv etc/apt/sources.list.d/ "$apt_sources_dir"
}

function install_addons() {
  local addon
  for addon in "$@"; do
    (
      cd -- "$addon" || exit 1
      ./install
    )
  done
}
