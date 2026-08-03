#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')
dir=$(basename "$cwd")
user=$(whoami)
host=$(hostname -s)

# Git branch info (skip optional locks)
git_branch=""
if git_branch_raw=$(git --git-dir="$cwd/.git" --work-tree="$cwd" symbolic-ref --short HEAD 2>/dev/null); then
  git_branch=" ($git_branch_raw)"
fi

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')

# Context window progress bar
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used_pct" ]; then
  # Round to nearest integer
  used_int=$(printf "%.0f" "$used_pct")
  # Build a 10-char bar (each block = 10%)
  filled=$(( used_int / 10 ))
  empty=$(( 10 - filled ))
  bar=""
  i=0
  while [ $i -lt $filled ]; do
    bar="${bar}█"
    i=$(( i + 1 ))
  done
  i=0
  while [ $i -lt $empty ]; do
    bar="${bar}░"
    i=$(( i + 1 ))
  done
  # Color: green <= 50%, yellow <= 80%, red > 80%
  if [ "$used_int" -le 50 ]; then
    bar_color='\033[32m'
  elif [ "$used_int" -le 80 ]; then
    bar_color='\033[33m'
  else
    bar_color='\033[31m'
  fi
  context_str=" ${bar_color}[${bar} ${used_int}%]\033[0m"
else
  context_str=""
fi

printf '\033[37m[%s@%s] \033[32m%s\033[37m%s\033[0m | \033[36m%s\033[0m%b' \
  "$user" "$host" "$dir" "$git_branch" "$model" "$context_str"
