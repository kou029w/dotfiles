.PHONY: help
help:
	@cat README.md

.PHONY: keyrings
keyrings: $(wildcard desktop/etc/apt/keyrings/*.gpg etc/apt/keyrings/*.gpg)

desktop/etc/apt/keyrings/chatgpt-archive-keyring.gpg:
	curl -sSfL --tlsv1.3 "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3BFA0E4AE8B8CC16A2D9BA684A3B4A566C4660E4" \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/claude-desktop-archive-keyring.gpg:
	curl -sSfL --tlsv1.2 https://downloads.claude.ai/claude-desktop/key.asc \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/google-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://dl.google.com/linux/linux_signing_key.pub \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/microsoft-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://packages.microsoft.com/keys/microsoft.asc \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/mozilla-archive-keyring.gpg:
	curl -sSfL --tlsv1.2 https://packages.mozilla.org/apt/repo-signing-key.gpg \
		| gpg --dearmor >$@

desktop/etc/apt/keyrings/slack-archive-keyring.gpg:
	curl -sSfL --tlsv1.2 https://packagecloud.io/slacktechnologies/slack/gpgkey \
		| gpg --dearmor >$@

etc/apt/keyrings/docker-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://download.docker.com/linux/ubuntu/gpg \
		| gpg --dearmor >$@

etc/apt/keyrings/mise-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://mise.jdx.dev/gpg-key.pub \
		| gpg --dearmor >$@

etc/apt/keyrings/tailscale-archive-keyring.gpg:
	curl -sSf --tlsv1.3 -o $@ https://pkgs.tailscale.com/stable/ubuntu/resolute.noarmor.gpg
