## Personal bash_profile file for OS X machines. Only purpose is to source .bashrc.

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
