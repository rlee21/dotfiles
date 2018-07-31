#!/bin/bash

set -e

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


CASK_PKGS=(
    "docker"
    "docker-toolbox"
    "iterm2"
    "homebrew/cask-versions/java8"
    "macdown"
    "postman"
    "pycharm-ce"
    "sequel-pro"
    "sqlworkbenchj"
    "sublime-text"
)

for CASK_PKG in "${CASK_PKGS[@]}"
do
    echo "Installing "$CASK_PKG" cask package..."
    brew cask install "$CASK_PKG"
done


PKGS=(
    "apache-spark"
    "avro-tools"
    "awscli"
    "dos2unix"
    "hadoop"
    "heroku"
    "hive"
    "jq"
    "kafka"
    "maven"
    "mysql"
    "node"
    "parquet-tools"
    "postgresql"
    "python@2"
    "python3"
    "ruby"
    "scala"
    "tmux"
    "tree"
    "vim"
    "wget"
)

for PKG in "${PKGS[@]}"
do
    echo "Installing "$PKG" package..."
    brew install "$PKG"
done
