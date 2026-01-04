.PHONY: help
help:
	@cat README.md

.PHONY: keyrings
keyrings: \
	desktop/etc/apt/keyrings/google-archive-keyring.gpg \
	desktop/etc/apt/keyrings/microsoft-archive-keyring.gpg \
	desktop/etc/apt/keyrings/slack-archive-keyring.gpg \
	desktop/etc/apt/keyrings/syncthing-archive-keyring.gpg \
	etc/apt/keyrings/docker-archive-keyring.gpg \
	etc/apt/keyrings/mise-archive-keyring.gpg \
	etc/apt/keyrings/tailscale-archive-keyring.gpg \

desktop/etc/apt/keyrings/google-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://dl.google.com/linux/linux_signing_key.pub \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/microsoft-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://packages.microsoft.com/keys/microsoft.asc \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/slack-archive-keyring.gpg:
	curl -sSfL --tlsv1.2 https://packagecloud.io/slacktechnologies/slack/gpgkey \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/syncthing-archive-keyring.gpg:
	curl -sSf --tlsv1.3 -o $@ https://syncthing.net/release-key.gpg

etc/apt/keyrings/docker-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://download.docker.com/linux/ubuntu/gpg \
		| gpg --dearmor >$@

etc/apt/keyrings/mise-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://mise.jdx.dev/gpg-key.pub \
		| gpg --dearmor >$@

etc/apt/keyrings/tailscale-archive-keyring.gpg:
	curl -sSf --tlsv1.3 -o $@ https://pkgs.tailscale.com/stable/ubuntu/questing.noarmor.gpg
