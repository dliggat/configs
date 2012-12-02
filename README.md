Configuration Files
===================
A common place to store configuration files for OS X, vim, etc.

## Symbolic Links
  * Create links from well-known locations to git repository: `ln -s ~/git/configs/os_x/bashrc.sh ~/.bashrc`


## Home Directory Links

    $ ls -la | grep lrwx
    lrwxr-xr-x    1 user  staff     50  1 Dec 23:12 .bash_profile -> /Users/user/git/configs/os_x/bash_profile.sh
    lrwxr-xr-x    1 user  staff     44  1 Dec 23:07 .bashrc -> /Users/user/git/configs/os_x/bashrc.sh
    lrwxr-xr-x    1 user  staff     48  1 Dec 23:13 .gitignore -> /Users/user/git/configs/os_x/gitignore.txt
    lrwxr-xr-x    1 user  staff     47  1 Dec 23:17 .gvimrc.after -> /Users/user/git/configs/os_x/gvimrc.after
    lrwxr-xr-x    1 user  staff     46  1 Dec 23:16 .vimrc.after -> /Users/user/git/configs/os_x/vimrc.after
