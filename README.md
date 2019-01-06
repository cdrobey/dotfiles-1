# My dotfiles repo

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.  I began with Nate McCurdy's dotfiles and expanded them to support my own use.

## Installation

### Homesick

1. Install Homesick with `gem install homesick`
1. Clone this castle with `homesick clone natemccurdy/dotfiles`
1. Create the symlinks with `homesick symlink dotfiles`

### Homebrew

I use [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) for most of my application installations

1. `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
1. Get Brew Bundler: `homesick cd && brew bundle`

### ZSH

1. oh-my-zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. `mkdir ~/src`
1. `git clone https://github.com/bhilburn/powerlevel9k.git ~/.themes/powerlevel9k
1. Make the following mod to .zshrc:  `ZSH_THEME='powerlevel9k/powerlevel9k'

### Homesick

1. Install Homesick with `gem install homesick`
1. Clone this castle with `homesick clone cdrobey/dotfiles`
1. Create the symlinks with `homesick symlink dotfiles`

### Vim plugins

1. [Vim-Plug](https://github.com/junegunn/vim-plug) Install: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
1. Install Vim plugins: `vim +PlugInstall +qall`

#### Colors

I use the GruvBox color scheme for iterm2. Grab a copy of it here, double-click it, then set that as your profile's color scheme.

<https://github.com/morhetz/gruvbox-contrib/raw/master/iterm2/gruvbox-dark.itermcolors>

#### Fonts

Install the Awesome patched fonts.

1. Download and install an Awesome patched font:
    * <https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf>
1. Switch iTerm2 to use that font for **Non ASCII Font**:

![](screenshots/iterm_text_options.png)

## OS X Defaults

My favorite part of this repo is the [set-defaults](osx/set-defaults.sh) script for OS X.

## Resources

I originally forked Nate McCurdy's dotfiles for my initial build.  I actively watch the following repositories and add the best changes to this repository:

- [Nate McCurdy dotfiles](https://github.com/natemccurdy/dotfiles)
- [GitHub ❤ ~/](http://dotfiles.github.com/)
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Nicolas Gallagher’s dotfiles](https://github.com/necolas/dotfiles)
- [Cătălin’s dotfiles](https://github.com/alrra/dotfiles)
- [Paul's dotfiles](https://github.com/paulirish/dotfiles)
- [Jacob Gillespie’s dotfiles](https://github.com/jacobwg/dotfiles)
