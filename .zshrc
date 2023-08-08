. /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
zstyle ':completion:*:*:git:*' script /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit
alias ..='cd ..'
alias cp='cp --reflink=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias ls='ls --color=auto'
precmd() {
  [[ "$TERM" == xterm-256color ]] && print -Pn -- '\e]2;%n@%m %~\a'
  [[ "$_PWD" == "$PWD" ]] && return
  _PWD="$PWD"
  ls
}
setopt PROMPT_SUBST
PROMPT='%B%F{green}%n@%m%f%b:%B%F{blue}%~%f%b $(__git_ps1 "%%F{green}(%s)%%f")
%# '
