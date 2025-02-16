# Set locale variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Source Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

# User configuration
alias g=git
alias vim='nvim'
alias gst='git status'
alias gcm='git commit -m'
alias dotfiles='cd ~/.dotfiles && vim'

# Path configurations
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$HOME/go/bin:$PNPM_HOME:$PATH"
export PATH="$HOME/fvm/default/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:/opt/homebrew/kitten"

 ide() {
  tmux split-window -v -l 30%
  clear
  tmux split-window -h -l 66%
  clear
  tmux split-window -h -l 50%
  clear
}

# Alias for shuf (GNU Coreutils) if installed via Homebrew
# This ensures 'shuf' is available as 'shuf' instead of 'gshuf'
if command -v gshuf >/dev/null 2>&1; then
    alias shuf='gshuf'
fi

# Define the 'kittybg' function to set a random background
kbg() {
    local backgrounds_dir="$HOME/.config/kitty/backgrounds"

    # Check if the backgrounds directory exists
    if [[ -d "$backgrounds_dir" ]]; then
        # Select a random image
        local image
        if command -v shuf >/dev/null 2>&1; then
            image=$(find "$backgrounds_dir" -type f | shuf -n 1)
        else
            # Use sort -R as a fallback if shuf is not available
            image=$(find "$backgrounds_dir" -type f | sort -R | head -n 1)
        fi

        # Check if a valid image was found
        if [[ -f "$image" ]]; then
            # Set the background image using Kitty's kitten command
            # Suppress any output
            kitten @ set-background-image "$image" >/dev/null 2>&1

        fi
    fi
}

# Source Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
