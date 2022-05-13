# Download Znap, if it's not there yet.
[[ -f ~/projects/settings/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/projects/settings/zsh-snap

# Install starship
if [ ! -f $HOME/.local/bin/starship ]; then
    mkdir -p ~/.local/bin
    curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin --yes
    rehash
fi

# Start znap
zstyle ':znap:*' repos-dir ~/projects/settings/zsh
source ~/projects/settings/zsh-snap/znap.zsh

# Setup our starship prompt
export STARSHIP_CONFIG="$HOME/projects/settings/starship/starship.toml"
znap eval starship 'starship init zsh --print-full-init'
znap prompt
