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
# some programs use this instead of EDITOR
export VISUAL=$EDITOR

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
HISTFILESIZE=100000
HISTSIZE=100000
HISTIGNORE="&:l[las]:[bf]g:l:a:j:f:b:e"
HISTCONTROL=erasedups:ignorespace
[ -z $HISTFILE ] && HISTFILE=$HOME/.bash_history

if [ "$BASH" != "" ]
then
    shopt -s histappend &> /dev/null
fi
