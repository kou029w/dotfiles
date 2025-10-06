[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && . /usr/share/doc/fzf/examples/key-bindings.bash
[[ "$TERM" =~ -256color$ ]] && PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "\[\033[32m\](%s)\[\033[00m\]")\n\$ '
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=$((0x7fffffff))
HISTSIZE=$((0x7fffffff))
PROMPT_COMMAND='[[ $_PWD == $PWD ]] || { _PWD=$PWD; ls; }'
alias ..='cd ..'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ll='ls -al'
alias ls='ls --color=auto'
set +o histexpand
