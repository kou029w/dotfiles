packages=(
bash-completion
build-essential
cloudflared
curl
docker-ce
docker-compose-plugin
fdupes
ffmpeg
fzf
git-crypt
imagemagick
jq
knot-dnsutils
nano
nodejs
qemu-user-static
screen
smartmontools
sqlite3
tailscale
)

if [[ "$(df --output=fstype . | sed 1d)" == "btrfs" ]]; then
  packages+=(snapper)
fi
