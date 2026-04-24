# color-grep initialization

# /usr/libexec/grepconf.sh -c || return

alias grep='grep --color=auto' 2>/dev/null
alias egrep='grep -E --color=auto' 2>/dev/null
alias fgrep='grep -F --color=auto' 2>/dev/null
export GREP_COLORS='ms=01;32;41:mc=01;31:sl=:cx=:fn=35:ln=32:bn=33:se=36'
alias ls='ls --color=auto'

# source my aliases in ~/.config/bash_aliases
# alias type organized by file name
if [ -d "$HOME/.config/bash-aliases" ]; then
  for file in "$HOME/.config/bash-aliases"/*; do
    if [ -r "$file" ]; then
      . "$file"
    fi
  done
fi
