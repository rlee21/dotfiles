#!/usr/bin/env bash


# install homebrew
echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew cask installs
brew cask install iterm2;
brew cask install sublime-text;
brew cask install Macdown;
brew cask install java;
brew cask install caskroom/versions/java8; # required for kafka

# brew installs
brew install git;
brew install python@2
brew install python3
brew install tmux;
brew install wget;
brew install tree;
brew install postgresql;
brew install mysql;
brew install python3;
brew install maven;
brew install dos2unix;
brew install jq;
brew install kafka;

