export HOME=$(getent passwd "${SUDO_USER:-$USER}" | cut -d: -f6)

function as_user() {
	sudo --user="#${SUDO_UID:-$UID}" "$@"
}

function install_dotfiles() {
	local dotfile
	for dotfile in .*; do
		[[ $dotfile =~ ^(\.\.?|\.git)$ ]] && continue
		ln -svf "$(realpath "$dotfile")" ~/
	done
}

function install_config() {
	local config
	as_user mkdir -p ~/.config
	for config in config/*; do
		as_user ln -svf "$(realpath "$config")" ~/.config/
	done
}

function install_apt_packages() {
	local packages
	local apt_sources_dir
	local apt_preferences_dir
	. packages.bash
	eval "$(apt-config shell apt_sources_dir 'Dir::Etc::sourceparts/d')"
	eval "$(apt-config shell apt_preferences_dir 'Dir::Etc::preferencesparts/d')"
	apt update
	apt install -y rsync
	rsync -rv etc/apt/keyrings/ /usr/share/keyrings/
	rsync -rv etc/apt/sources.list.d/ "$apt_sources_dir"
	[[ -d etc/apt/preferences.d ]] && rsync -rv etc/apt/preferences.d/ "$apt_preferences_dir"
	[[ -d etc/default ]] && rsync -rv etc/default/ /etc/default/
	apt update
	apt install -y "${packages[@]}"
}

function install_addons() {
	local addon
	for addon in "$@"; do
		(cd -- "$addon" && ./install)
	done
}
