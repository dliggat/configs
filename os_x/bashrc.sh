## Personal bashrc file for OS X machines. Contains aliases, env vars, etc.

#### Todo.txt related stuff follows.
TODO_ROOT="/Users/$USER/Dropbox/todo"
EXCLUDE="slp"
# A function to dispatch access to todo.txt.
function t() {
    # `t` - No args => just list the task list, but exclude the $EXCLUDE string.
    if [ $# -eq 0 ] 
    then
        $TODO_ROOT/todo.sh -a -d $TODO_ROOT/todo.cfg ls | grep -v $EXCLUDE

    # `t edit` => open the task list for edit in a text editor. 
    elif [ "$1" = "edit" ]
    then
        open $TODO_ROOT/todo.txt

    # Otherwise pass the arguments to todo.sh.
    else
        $TODO_ROOT/todo.sh -a -d $TODO_ROOT/todo.cfg $*
    fi
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

function shortpath {
  #   How many characters of the $PWD should be kept
  local pwd_length=30
  local lpwd="${PWD/#$HOME/~}"
  if [ $(echo -n $lpwd | wc -c | tr -d " ") -gt $pwd_length ]
    then newPWD="...$(echo -n $lpwd | sed -e "s/.*\(.\{$pwd_length\}\)/\1/")"
    else newPWD="$(echo -n $lpwd)"
  fi
  echo $newPWD
}

# Taken from http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# Also read this: http://superuser.com/questions/246625/bash-command-prompt-overwrites-the-current-line
# Use the start and stop tokens to define a period of time for color to be activated.
WHITE="0;37m\]"
YELLOW="0;33m\]"
GREEN="0;32m\]"
RED="0;31m\]"
START="\[\e["
STOP="\[\e[m\]"
PROMPT_COMMAND='RET=$?;'
RET_VALUE='$(echo $RET)'
export PROMPT_COMMAND='PS1="\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\!] $START$YELLOW\u@\h:$STOP $START$WHITE\$(shortpath)$STOP$START$RED\$(parse_git_branch)$STOP \$ "'   

# MacPorts Installer addition on 2011-10-17_at_22:30:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# How to set ls colors: http://www.napolitopia.com/2010/03/lscolors-in-osx-snow-leopard-for-dummies/
# This DOES NOT work in linux (at least not Fedora). In Linux, need to change /etc/DIR_COLORS.
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='GxHxxxxxBxxxxxxxxxgxgx'

# My custom environment variables and aliases.
export notes="/Users/$USER/Dropbox/notes"
alias ff='find . -type f | sort'
alias fd='find . -type d | sort'
alias grep='grep --color=auto'
alias gs='git status'
alias sha1sum='openssl sha1'
alias spec='rspec -b -c -f s'
alias statement='python /Users/$USER/git/statement_parser/parser.py'
alias clean='pbpaste | pbcopy'

# Enable the ability to prevent addition to .bash_history with prepended space.
export HISTCONTROL=ignorespace

# Bring in any local, machine specific variables that should not be committed to github.
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

