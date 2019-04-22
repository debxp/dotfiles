# ------------------------------------------------------------------------------
# Aliases and functions for commands
# ------------------------------------------------------------------------------

# ls
alias ls='ls -Nghol --group-directories-first --color=auto'
alias ll='ls -C'
alias l.='ls -d .*'
alias la='echo "" && ls && echo -e "\n--- hidden ---\n" && l.'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# cd
alias ..='cd ..'
alias cd..='cd ..'
alias ~='cd ~'

# apt
alias up='sudo apt update'
alias upl='apt list --upgradable | less'
alias upg='sudo apt upgrade'

alias apti='sudo apt install'
apts() { apt-cache show "$@" | less; }
aptq() { apt-cache search "$@" | less; }

# git
alias gitc='git clone'

#moc
alias mocp="mocp --theme=transparent-background"

# create .tar.gz 
targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }

# extract .tar.gz
untargz() { tar -zxvf $1; rm -r $1; }

# make a folder and go into it
mkcd() { mkdir -p $1; cd $1; }

# ------------------------------------------------------------------------------
# Auto complete apt(x) aliases
# ------------------------------------------------------------------------------

auto_complete_apt() { 
    mapfile -t COMPREPLY < <(apt-cache --no-generate pkgnames "$2");
}
complete -F auto_complete_apt apti
complete -F auto_complete_apt apts
complete -F auto_complete_apt aptq

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

# [~]:
# PS1='\[\033[1;35m\][\[\033[1;36m\]\w\[\033[1;35m\]]\[\033[0;33m\]:\[\033[00m\] '

# :~$
PS1='\[\e[32m\]:\[\e[m\]\[\e[32m\]\w\[\e[m\]\[\e[32m\]\\$\[\e[m\] '

# ------------------------------------------------------------------------------
# X Terminal title
# ------------------------------------------------------------------------------

case "$TERM" in
xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:$(dirs +0)\$\007"'
        ;;
*)
        ;;
esac

# ------------------------------------------------------------------------------
# Path
# ------------------------------------------------------------------------------
export PATH="$PATH:$HOME/.local/bin"
