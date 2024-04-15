packages=(
build-essential
cloudflared
curl
docker-ce
docker-compose-plugin
fdupes
ffmpeg
git-crypt
imagemagick
jq
knot-dnsutils
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
