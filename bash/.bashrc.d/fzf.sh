# fzf shell integration.
# Arch ships these scripts but does not auto-source them.

# Back the ** trigger with fd instead of find: respects .gitignore, shows
# hidden files, skips .git. $1 is the base directory fzf is completing under.
if command -v fd >/dev/null; then
  _fzf_compgen_path() {
    fd --hidden --follow --exclude .git . "$1"
  }
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude .git . "$1"
  }
  export FZF_CTRL_T_COMMAND='fd --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# ** trigger completion (mv **<Tab>, ssh **<Tab>, kill **<Tab>, ...)
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# Ctrl-T paste file, Ctrl-R history search, Alt-C cd. Drop this line if you
# would rather keep those keys bound to their readline defaults.
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
