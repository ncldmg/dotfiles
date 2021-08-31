export GOBIN=~/go/bin
export GOPATH=~/go
export CARGOBIN=$XDG_DATA_HOME/cargo/bin
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_ROOT="$HOME/.pyenv"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
export POETRY=$HOME/.poetry/bin
export NPM_MODULES=$HOME/.local/share/npm/bin
export PYTHON37=/usr/local/opt/python@3.7/bin

export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
export SBIN="/usr/local/sbin"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

export KREW=${KREW_ROOT:-$HOME/.krew}/bin

export PATH=$PATH:$HOME/.istioctl/bin:$GOBIN:$CARGOBIN:$NPM_MODULES:$PYENV_ROOT:$GOROOT/bin:/usr/local/:$KREW
