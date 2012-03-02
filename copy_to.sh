#!/bin/bash

function usage() {
  echo "Usage: `basename $0` { to_local | to_git }"
}

EXPECTED_ARGS=1
if [ $# -ne $EXPECTED_ARGS ]
then
  echo $(usage)
  exit 1
fi

LOCAL_DIR="/Users/$USER"
GIT_DIR="/Users/$USER/git/configs/os_x"

if [ $1 == 'to_local' ]
then
  echo "Copying files from git repository to local..."
  echo "$GIT_DIR/bash_profile.sh"  "$LOCAL_DIR/.bash_profile"
  echo "$GIT_DIR/bashrc.sh"        "$LOCAL_DIR/.bashrc"
  echo "$GIT_DIR/vimrc"            "$LOCAL_DIR/.vimrc"
  echo "$GIT_DIR/gvimrc"           "$LOCAL_DIR/.gvimrc"
elif [ $1 == 'to_git' ]
then
  echo "Copying files from local to git repository..."
  echo "$LOCAL_DIR/.bash_profile"  "$GIT_DIR/bash_profile.sh"  
  echo "$LOCAL_DIR/.bashrc"        "$GIT_DIR/bashrc.sh"        
  echo "$LOCAL_DIR/.vimrc"         "$GIT_DIR/vimrc"            
  echo "$LOCAL_DIR/.gvimrc"        "$GIT_DIR/gvimrc"           
else
  echo "Error. $(usage)"
  exit 1
fi

