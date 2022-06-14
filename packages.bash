packages=(
cloudflared
docker-ce
docker-compose-plugin
nodejs
tailscale
build-essential
curl
fdupes
ffmpeg
imagemagick
knot-dnsutils
qemu-user-static
screen
smartmontools
)

if [[ "$(df --output=fstype . | sed 1d)" == "btrfs" ]]; then
  packages+=(snapper)
fi
