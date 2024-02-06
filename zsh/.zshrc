export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation. 
export ZSH="$HOME/.oh-my-zsh"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

# User configuration
alias g=git
alias vim='nvim'
alias gst='git status'
alias gcm='git commit -m'
alias dotfiles='vim ~/.dotfiles'

export PNPM_HOME="/Users/dave/Library/pnpm"
export PATH="$HOME/go/bin:$PNPM_HOME:$PATH"
export PATH="$HOME/fvm/default/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
