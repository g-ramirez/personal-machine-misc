export LS_COLORS="di=1;31"
export EDITOR=/usr/bin/vim
alias 'ls'='ls --color'
alias 'll'='ls -lta'
alias 'ovpn-start'='sudo systemctl start openvpn-client@client'
#alias 'ovpn-stop'="for pid in $(ps aux|grep openvpn|grep client.conf|awk {'print $2'}) do sudo kill -9 $pid;done;"
alias "ovpn-stop"="sudo systemctl stop openvpn-client@client"
alias "sshuttle-traffic"="sshuttle -r ubuntu@bastion 10.5.0.0/16&"
alias "start-servers"="zsh /home/gabe/bin/start-servers.sh"
alias "sosser"="source /home/gabe/bin/sosser"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gabe/.zshrc'
ENABLE_CORRECTION="true"
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-searcha
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
# End of lines added by compinstall

autoload -Uz promptinit
promptinit
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

prompt fire 57 57 57 39 39 39 

if [ -f /etc/bash.command-not-found ]; then
	. /etc/bash.command-not-found
fi

autoload -Uz bashcompinit
bashcompinit

source ~/juju-autocomplete
