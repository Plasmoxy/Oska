# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
export LC_ALL="en_US.UTF-8"

# SEBUBUB


# PS1='\[\e[0;38;5;105m\](\[\e[0;38;5;111m\]!\[\e[0;38;5;111m\]\! \[\e[0;38;5;105m\]\A \[\e[0;38;5;189m\]\u \[\e[0;38;5;189m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;38;5;105m\]) \[\e[0;38;5;227m\]\w \[\e[0;38;5;86m\]Ξ \[\e[0m\]'


# no ita lambda
# PS1='\[\e[0;38;5;105m\](\[\e[0;38;5;111m\]!\[\e[0;38;5;111m\]\! \[\e[0;38;5;105m\]\A \[\e[0;38;5;189m\]\u \[\e[0;38;5;189m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;38;5;105m\]) \[\e[0;38;5;227m\]\w \[\e[0;38;5;86m\]λ \[\e[0m\]'

# ita lambda
PS1='\[\e[0;38;5;105m\](\[\e[0;38;5;111m\]!\[\e[0;38;5;111m\]\! \[\e[0;38;5;105m\]\A \[\e[0;38;5;189m\]\u \[\e[0;38;5;189m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;38;5;105m\]) \[\e[0;38;5;227m\]\w \[\e[0;3;38;5;86m\]λ \[\e[0m\]'


neofetch | lolcat
echo -en "\n"
fortune | cowsay -f fox | lolcat
echo -en "\n"

alias l='du -sh;LC_ALL="C" ls -lahF --group-directories-first'
alias ll='du -sh;LC_ALL="C" ls -lahF --group-directories-first | lolcat -S 25'
alias grep='grep --color'
alias man='man -P /usr/bin/most'

# ssh agent
SSH_ENV="$HOME/.ssh/agent-environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
