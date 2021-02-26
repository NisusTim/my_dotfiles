#! /bin/bash
shopt -s -o nounset

##################################################
# INCLUDE DIRECTIVE                              #
##################################################

##################################################
# FUNCTION                                       #
##################################################
function main()
{
  :
}

function exit()
{
  set +u
}

function nvim()
{
  #sudo apt-get install neovim
  #sudo apt-get install python-dev 
  #sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
  mkdir -p ~/.config/nvim
  cp init.vim ~/.config/nvim/
  #nvim
}

# Apply "Dracula" theme config, "gitk"
# 
function gitk()
{
  mkdir -p ~/.config/git
  cp gitk ~/.config/git/
}

# Apply black theme, background/lock screen image, icons on desktop,
# dock enabled, etc.
function gnome_tweaks_apply()
{
  dconf load / < gnome-tweaks/dconf-settings.ini
}

function gnome_tweaks_export()
{
  dconf dump / > gnome-tweaks/dconf-settings.ini
}

##################################################
# MAIN                                           #
##################################################
main "$@"
# allow to call function based on arguments passed to the script
$*
exit

