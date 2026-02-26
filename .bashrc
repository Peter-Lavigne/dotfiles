# https://web.archive.org/web/20090815205011/http://www.cuberick.com/2008/11/update-bash-history-in-realtime.html
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Increase bash history size
# Source: https://askubuntu.com/a/307568
HISTSIZE=5000
HISTFILESIZE=10000

# Map ^J to interrupt, so I can use ^C to copy
stty intr ^J

# Use uv bash completions
eval "$(uv generate-shell-completion bash)"

# Ubuntu lacks an equivalent of Mac's ^K to clear, so I use C + <enter>
alias c=clear

# Additional bin directories to add to $PATH
export PATH="$PATH:$HOME/bin/.venv/bin"
export PATH="$PATH:$HOME/.local/bin"

# Set up fzf key bindings
source /usr/share/doc/fzf/examples/key-bindings.bash

# Set the prompt to '\n<directory> $ '.
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_current_directory() {
    pwd | sed -e "s|^$HOME/||"
}
CYAN='\[\e[0;96m\]'
WHITE='\[\e[0;00m\]'
export PS1="\n${CYAN}\$(parse_current_directory)${WHITE} $ "

