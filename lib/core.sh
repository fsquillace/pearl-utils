#*******************
#** Generics options
#*******************
# Options will work on bash only
if [ "$BASH" != "" ]
then
    shopt -s cdspell &> /dev/null
    shopt -s autocd  &> /dev/null
    shopt -s dirspell &> /dev/null
    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize &> /dev/null
fi

#*******************
#** Generic variables
#*******************
export EDITOR=vim
export VISUAL=$EDITOR # some programs use this instead of EDITOR

#*******************
#** Bindings
#*******************
# Binddings will work on bash only
if [ "$BASH" != "" ]
then
    # Prefix sudo to the command
    bind '"\C-xs":"\C-asudo \C-e"'
fi

#*******************
#** History
#*******************
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTIGNORE="&:l[las]:[bf]g:l:a:j:f:b:e"
export HISTCONTROL=erasedups:ignorespace
[ -z $HISTFILE ] && export HISTFILE=$HOME/.bash_history

if [ "$BASH" != "" ]
then
    shopt -s histappend &> /dev/null
fi
