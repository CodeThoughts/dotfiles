#!/usr/bin/env bash

export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles:
for file in ~/.{functions,exports,aliases,credentials}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# git branch status in prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
force_color_prompt=yes

# set vim as default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

