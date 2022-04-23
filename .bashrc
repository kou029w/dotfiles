[[ -f "$HOMEBREW_PREFIX/etc/bash_completion" ]] && . "$HOMEBREW_PREFIX/etc/bash_completion"
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ "$TERM" == xterm-256color ]] && PS1='\[\e]0;\u@\h: \w\a\]'
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=2000000
HISTSIZE=2000000
PROMPT_COMMAND='[[ $_PWD == $PWD ]] || { _PWD=$PWD; ls; }'
PS1=$PS1'\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1=${PS1%'\$ '}'$(__git_ps1 " \[\033[32m\](%s)\[\033[00m\]")\n\$ '
alias ..='cd ..'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias ls='ls --color=auto'
set +o histexpand
