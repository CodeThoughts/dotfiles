#! /bin/bash

source ~/.aliases;

force_color_prompt=yes;

# git branch status in prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt;
source "${GITAWAREPROMPT}/main.sh";
export PS1="\u@$(ifconfig | grep "inet " | grep -v 127.0.0. | awk '{print $2}')\[\033[00m\]\[\033[0;32m\]: \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ ";
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ ";

export LANG=en_GB.utf-8;
export LC_ALL=en_GB.UTF-8;

export GOPATH=$(go env GOPATH)
