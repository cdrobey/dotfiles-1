#!/usr/bin/env bash
#
# Run this on a stock Mac to bootstrap it with Nate's dotfiles and customizations
#

PROJECTS="~/Projects"

# Ask for the administrator password upfront
echo "Asking for your sudo password upfront..."
sudo -v

# Keep-alive: update existing `sudo` time stamp until this has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install homebrew and git (xcode tools)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Create our code directory
[[ -d "$PROJECTS" ]] || mkdir "$PROJECTS"

# Install HomeBrew apps
brew bundle --file=~/.homesick/repos/dotfiles/Brewfile
brew cask cleanup

# Pin Ruby versions so I don't lose all my gems on upgrade.
brew pin ruby
brew pin ruby-build
brew pin rbenv


# Get Homesick for dotfiles
homeshick clone cdrobey/dotfiles-new
homeshick symlink dotfiles-new

# Install some Puppet and ruby tools
#gem install r10k puppet-lint rubocop

# Install vim Plug
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
## Get Vim plugins
#vim +PlugInstall +qall

## Install Oh My ZSH and change shell to zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#echo "Changing ${USER}'s shell to Brew's zsh..."
sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Get fonts
#echo "Downloading Inconsolata fonts to ~/Library/Fonts/"
#wget -P ~/Library/Fonts/ https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf
#wget -P ~/Library/Fonts/ https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
#
# Get iTerm gruvbox colors
echo "Installing GruvBox colors for iTerm2"
wget https://github.com/morhetz/gruvbox-contrib/raw/master/iterm2/gruvbox-dark.itermcolors
open gruvbox-dark.itermcolors
rm gruvbox-dark.itermcolors

# Run MACOS config script
#echo "Configuring a bunch of MACOS things"
#sh ~/.homesick/repos/dotfiles/home/.bin/macos.sh
#
#echo
#echo "Finished!"
echo
echo "All that's left is to configure iTerm2: https://github.com/chris.roberson/dotfiles#colors-and-fonts"
echo
read -r -p "Also, you should reboot. Do that now? [Y/n]: " answer
if [[ $answer =~ ^[Yy]$ ]]; then
  sudo reboot
fi

