#! /bin/bash

source ~/.aliases

# git branch status in prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
force_color_prompt=yes

# set vim as default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

