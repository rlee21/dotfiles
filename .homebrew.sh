#!/bin/bash

set -e

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


echo "Updating homebrew..."
brew update


PKGS=(
    "apache-spark"
    "avro-tools"
    "awscli"
    "dos2unix"
    "gdbm"
    "gettext"
    "git"
    "hadoop"
    "heroku"
    "heroku-node"
    "hive"
    "icu4c"
    "jq"
    "kafka"
    "libevent"
    "libidn2"
    "libunistring"
    "libyaml"
    "maven"
    "mysql"
    "node"
    "oniguruma"
    "openssl"
    "parquet-tools"
    "perl"
    "postgresql"
    "putty"
    "python"
    "python@2"
    "readline"
    "ruby"
    "scala"
    "sqlite"
    "tmux"
    "tree"
    "vim"
    "wget"
    "xz"
    "zookeeper"
)

for PKG in "${PKGS[@]}"
do
    echo "Installing "$PKG" package..."
    brew install "$PKG"
done


CASK_PKGS=(
    "docker"
    "docker-toolbox"
    "iterm2"
    "java8"
    "macdown"
    "postman"
    "pycharm-ce"
    "sequel-pro"
    "sqlworkbenchj"
    "sublime-text"
    "virtualbox"
)

for CASK_PKG in "${CASK_PKGS[@]}"
do
    echo "Installing "$CASK_PKG" cask package..."
    brew cask install "$CASK_PKG"
done

