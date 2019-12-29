# ~/.zprofile: executed by zsh(1) runs at login, including over SSH.

# if [ -f ~/.bashrc ]; then
#     source ~/.bashrc
# fi

alias ls='ls -aFC'
alias la='ls -laF'
alias lc='ls -laFt'
alias h='history'
alias purge='rm -f .*~ *~ \#*\#'

alias m2u='tr '\''\015'\'' '\''\012'\'''
alias u2m='tr '\''\012'\'' '\''\015'\'''
