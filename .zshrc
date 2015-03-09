HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
autoload -U compinit
compinit
autoload -U colors && colors

PROMPT="[%{$fg[blue]%}%~%{$reset_color%}]$ "

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# keys 
#[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
#[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
#[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
#[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
#[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
#[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
#[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
#[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history '\e[3~' delete-char

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history

alias themes="sudo thunar /usr/share/themes/"
alias icons="sudo thunar /usr/share/icons/"

