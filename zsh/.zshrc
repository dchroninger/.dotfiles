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
alias dotfiles='vim ~/.dotfiles'

# Path configurations
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$HOME/go/bin:$PNPM_HOME:$PATH"
export PATH="$HOME/fvm/default/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"

# Source Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias for shuf (GNU Coreutils) if installed via Homebrew
# This ensures 'shuf' is available as 'shuf' instead of 'gshuf'
if command -v gshuf >/dev/null 2>&1; then
    alias shuf='gshuf'
fi

# Set a random Kitty background image on startup
if [[ -n "$KITTY_WINDOW_ID" && -z "$KITTY_BACKGROUND_SET" ]]; then
    # Directory containing background images
    backgrounds_dir="$HOME/.config/kitty/backgrounds"

    # Check if the backgrounds directory exists
    if [[ -d "$backgrounds_dir" ]]; then
        # Select a random image using find and sort -R for better handling of filenames
        random_image=$(find "$backgrounds_dir" -type f | sort -R | head -n 1)

        # Check if a valid image was found
        if [[ -f "$random_image" ]]; then
            # Set the background image using Kitty's kitten command
            kitten @ set-background-image "$random_image"
            clear

            # Export a variable to indicate that the background has been set for this session
            export KITTY_BACKGROUND_SET=1
        else
            echo "No valid image found in $backgrounds_dir."
        fi
    else
        echo "Backgrounds directory $backgrounds_dir does not exist."
    fi
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

