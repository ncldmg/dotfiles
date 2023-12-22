# export TERM=xterm-256color
export EDITOR='lvim'

# zsh history
export HISTFILE=~/.local/share/zsh/history
export HISTSIZE=500000
export SAVEHIST=500000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.


# GPG
GPG_TTY=$(tty)
export GPG_TTY

# Set all XDG locations to load config
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/tmp

export GOPRIVATE="github.com/ionos-cloud,github.com/ionos-cloud/*,github.com/ionos-cloud/*/*"

fpath+=(~/.config/ionosctl/completion/zsh)

plugins=(git ssh-agent)

autoload -U promptinit; promptinit
autoload -Uz compinit
compinit

# Load alias
if [ -f $XDG_CONFIG_HOME/zsh/.zshrc.d/alias.sh ]; then
    source $XDG_CONFIG_HOME/zsh/.zshrc.d/alias.sh
else
    print "404: $XDG_CONFIG_HOME/zsh/.zshrc.d/alias.sh not found"
fi
# Load path
if [ -f $XDG_CONFIG_HOME/zsh/.zshrc.d/path.sh ]; then    source $XDG_CONFIG_HOME/zsh/.zshrc.d/path.sh
else
    print "404: $XDG_CONFIG_HOME/zsh/.zshrc.d/path.sh not found"
fi
# Load xdg path
if [ -f $XDG_CONFIG_HOME/zsh/.zshrc.d/xdg.sh ]; then
    source $XDG_CONFIG_HOME/zsh/.zshrc.d/xdg.sh
else
    print "404: $XDG_CONFIG_HOME/zsh/.zshrc.d/xdg.sh not found"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Start tmux on every terminal launch
alias tmux="tmux"
if [ "$TMUX" = "" ]; then tmux; fi

# eval "$(starship init zsh)"

autoload -U promptinit; promptinit
prompt pure

eval `ssh-agent -s`
ssh-add 

# direnv
eval "$(direnv hook zsh)"


# fzf config
[ -f $XDG_CONFIG_HOME/zsh/.zshrc.d/fzf.sh ] && source $XDG_CONFIG_HOME/zsh/.zshrc.d/fzf.sh

# virtual env config
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

source <(kubectl completion zsh)

source <(helm completion zsh)

source <(d2vm completion $(basename $SHELL))

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
