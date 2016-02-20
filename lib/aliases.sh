#@@@@@@@@@@@@@@@@@@
#@@ Aliases
#@@@@@@@@@@@@@@@@@@

alias ..="cd .."
alias ...="cd ../.."
alias "cd.."="cd .."
alias "cd-"="cd -"
alias "cd~"="cd $HOME"

# Mini-aliases :)
alias j="jobs"
alias f="fg"
alias b="bg"
alias q="exit"
alias ls="/bin/ls --color=auto"

alias l="ls --color=auto -h"
alias a="ls -ha"
alias c="cal"
alias d="date"
alias e='$EDITOR'
alias p='pwd'
alias h='hostname'
alias t='tree'

alias ll="l -l"
alias la="a -l"

alias home="cd $HOME"
alias ~="cd $HOME"

# Allows to keep aliases in sudo
alias sudo="sudo "
#alias sudo="sudo -E"    # Useful to keep variables environment when you are root

alias go="ping 8.8.8.8"
alias goo="ping www.google.com"

# Grep-based aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Looks up to the history
alias hgrep='history | grep'

# Open screen+irssi
alias scrssi="screen -S scrssi -aARd -t irssi irssi; clear"

# less case insensitive
alias less="less -i"

# Enhanced ssh for X11 forwarding and 256 colors
alias sshx="TERM=xterm-256color LANG=en_US.UTF-8 ssh -Y"

# Enhanced mosh for 256 colors
alias moshx="LANG=en_US.UTF-8 mosh"

alias webserver='python2.7 -m SimpleHTTPServer'
alias webserver3='python -m http.server'

#@@@@@@@@@@@@@@@@@@@