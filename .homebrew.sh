#!/bin/bash

set -e

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


CASK_PKGS=(
    "iterm2"
    "homebrew/cask-versions/java8"
    "macdown"
    "postman"
    "pycharm-ce"
    "sequel-pro"
    "sublime-text"
)

for CASK_PKG in "${CASK_PKGS[@]}"
do
    echo "Installing "$CASK_PKG" cask package..."
    brew cask install "$CASK_PKG"
done


PKGS=(
    "tmux"
    "apache-spark"
    "avro-tools"
    "dos2unix"
    "heroku/brew/heroku"
    "jq"
    "maven"
    "zookeeper"
    "kafka"
    "mysql"
    "node"
    "parquet-tools"
    "postgresql"
    "python@2"
    "scala"
    "tree"
    "wget"
    "reattach-to-user-namespace"
    "rbenv"
)

for PKG in "${PKGS[@]}"
do
    echo "Installing "$PKG" package..."
    brew install "$PKG"
done
