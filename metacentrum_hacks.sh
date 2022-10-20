#!/bin/bash
# set default permissions for created files, so that colleages can read/write them
#echo "umask 0007" > .bashrc

# initialize ssh keys
#mkdir .ssh
#ssh-keygen -t ed25519 -f github_metacentrum # change name
# now copy the filename.pub to your github account

# add this to your .bash_profile. It starts the ssh-agent at login

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
export VISUAL=vim
export EDITOR="$VISUAL"

# now run
source ~/.bash_profile
ssh-add github_metacentrum

