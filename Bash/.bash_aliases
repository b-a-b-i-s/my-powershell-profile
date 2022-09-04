# Enter the following 3 lines in ~/.bashrc
# if [ -e $HOME/.bash_aliases ]; then
#     source $HOME/.bash_aliases
# fi

# Most of these are taken from https://opensource.com/article/19/7/bash-aliases

alias ls='ls --file-type'

alias ll='ls -lh --file-type'

# Sort by file size
alis lt='ls --human-readable --size -1 -S  --file-type'
# On MacOS or BSD, the ls command doesn’t have the same options, so this alias works instead:
# alias lt='du -sh * | sort -h'

# View only mounted drives
# TODO find out which of these works in actual linux. In WSL the second oneworks.
# alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias mnt="mount | awk -F' ' '{ printf "%s\t%s\n",$1,$3; }' | column -t | egrep ^/dev/ | sort"
# On MacOS, the mount command doesn’t provide terribly verbose output, so an alias may be overkill. However, if you prefer a succinct report, try this:
# alias mnt='mount | grep -E ^/dev | column -t'


# Find a command in your grep history
alias gh='history|grep'

# Sort by modification time
alias left='ls -t -1'

# Count files
alias count='find . -type f | wc -l'

# Create a Python virtual environment
alias ve='python3 -m venv ./.venv'
alias va='source ./.venv/bin/activate'

# Add a copy progress bar
alias cpv='rsync -ah --info=progress2'

# Protect yourself from file removal accidents. Also see https://gitlab.com/trashy/trashy
alias tcn='mv --force -t ~/.local/share/Trash '

# Simplify your Git workflow
alias cg='cd `git rev-parse --show-toplevel`'
alias startgit='cd `git rev-parse --show-toplevel` && git checkout main && git pull'
