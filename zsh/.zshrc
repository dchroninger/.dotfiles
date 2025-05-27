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
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load?
plugins=(git web-search)

# User configuration
alias g=git
alias vim='nvim'
alias gst='git status'
alias gcm='git commit -m'
alias dotfiles='cd ~/.dotfiles && vim'
eval $(thefuck --alias)

# Path configurations
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/fvm/default/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

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

# Source Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
