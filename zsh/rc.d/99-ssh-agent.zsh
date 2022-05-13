#!/bin/zsh

# Setup our SSH Agent
if [[ $platform == "windows-wsl" ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock

    local running=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
    if [[ $running != "0" ]]; then
        if [[ -S $SSH_AUTH_SOCK ]]; then
            echo "removing previous socket..."
            rm $SSH_AUTH_SOCK
        fi

        # setsid to force new session to keep running
        # set socat to listen on $SSH_AUTH_SOCK and forward to npiperelay which then forwards to openssh-ssh-agent on windows
        (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
    fi
fi
