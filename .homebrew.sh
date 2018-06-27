#!/usr/bin/env bash

set -e

# install homebrew
echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew installs
echo "Installing brew packages..."
brew install apache-spark;
brew install avro-tools;
brew install awscli;
brew install dos2unix;
brew install gdbm;
brew install gettext;
brew install git;
brew install hadoop;
brew install heroku;
brew install heroku-node;
brew install hive;
brew install icu4c;
brew install jq;
brew install kafka;
brew install libevent;
brew install libidn2;
brew install libunistring;
brew install libyaml;
brew install maven;
brew install mysql;
brew install node;
brew install oniguruma;
brew install openssl;
brew install parquet-tools;
brew install perl;
brew install postgresql;
brew install putty;
brew install python;
brew install python@2;
brew install readline;
brew install ruby;
brew install scala;
brew install sqlite;
brew install tmux;
brew install tree;
brew install vim;
brew install wget;
brew install xz;
brew install zookeeper;

# brew cask installs
echo "Installing cask packages..."
brew cask install docker;
brew cask install docker-toolbox;
brew cask install iterm2;
brew cask install java8;
brew cask install macdown;
brew cask install postman;
brew cask install pycharm-ce;
brew cask install sequel-pro;
brew cask install sqlworkbenchj;
brew cask install sublime-text;
brew cask install virtualbox;
