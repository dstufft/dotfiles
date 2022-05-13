#!/bin/zsh

# Setup our SSH Agent
if [[ $platform == "windows-wsl" ]]; then
    export SSH_AUTH_SOCK=$(mktemp -d -q -t ssh-XXXXXXXXXX)/agent.sock

    () {
        setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR

        # set socat to listen on $SSH_AUTH_SOCK and forward to npiperelay which then forwards to openssh-ssh-agent on windows
        socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork >/dev/null 2>&1 &!
    }
fi
