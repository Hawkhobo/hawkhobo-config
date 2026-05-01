if [ -t 0 ]; then
  echo " ~ $(pwd)/.bashrc ~ "
  for rc in $HOME/.config/bash/.bashrc.d/*.sh; do
    source $rc
  done
fi

# add helpme executable to path
export PATH="$HOME/projects/helpme:$PATH"
# editor used by helpme
export HELPME_EDITOR=nvim
export PATH="$HOME/bin:$PATH"

if command -v ruby; then
  export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
fi

# extended globbing for better pattern matching with bash commands
shopt -s extglob

# default (see bind -q edit-and-execute-command
export VISUAL=nvim

# fuzzy finder config. allows for quick selection!
export FZF_DEFAULT_OPTS=" \
  --layout=reverse \
  --height=40% \
  --bind 'ctrl-j:down,ctrl-k:up,ctrl-a:select-all,ctrl-d:deselect-all,shift-down:toggle+down,shift-up:toggle+up'\
"

# let wayland copy ignore broken pipe issues
alias wl-copy='wl-copy 2>/dev/null'
