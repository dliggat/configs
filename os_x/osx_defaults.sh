#!/bin/bash

# Ask for the administrator password upfront
sudo -v

defaults write com.apple.finder AppleShowAllFiles TRUE  # Show dotfiles and dot directories in finder.

killall Finder && open /System/Library/CoreServices/Finder.app
# for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
#   "Mail" "Safari" "SizeUp" "SystemUIServer" "Terminal" "Transmission" \
#   "Twitter" "iCal" "iTunes"; do
# killall "$app"    > /dev/null 2>&1
# done
# echo "Done. Note that some of these changes require a logout/restart to take effect."
# done

