# Path to your oh-my-zsh installation.
  export ZSH=/home/pablore/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

set editing-mode vi
 HIST_STAMPS="mm/dd/yyyy"
plugins=(git tmux apt-get git-flow)

# User configuration


# export MANPATH="/usr/local/man:$MANPATH"

#export NSYSTEM="/home/pablo/Desktop/nsystem64-beta2/"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

setenv () {
  if [ "x$1" = "x" ] ; then
    echo "$0: environment variable name required" >&2
  elif [ "x$2" = "x" ] ; then
    echo "$0: environment variable value required" >&2
  else
    export $1=$2
  fi
}

unsetenv () {
  if [ "x$1" = "x" ]; then
    echo "$0: environment variable name required" >&2
  else
    unset $1
  fi
}
# Functions
export MARKPATH=$HOME/.marks
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"

}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"

}
function unmark {
  rm -i "$MARKPATH/$1"

}
function marks {
  \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'

}

function _completemarks {
  reply=($(ls $MARKPATH))

}

compctl -K _completemarks jump
compctl -K _completemarks unmark

alias j="jump"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

PATH=$PATH:~/bin/

alias insert_user="(cat ../user.json | meteor mongo)"
alias pingu="ping 8.8.8.8"
alias g++11="g++ -Wall -Wextra -Wno-unused-result -std=c++11 -O2 -o k"
alias v="vim"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias ccat="pygmentize -g"
alias open="xdg-open &>/dev/null"
alias gvim="hide-warnings gvim"
# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#if [ "$TERM" != "screen-256color" ]; then
#  exec tmux;
#fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/home/pablore/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


#. /home/unu/torch/install/bin/torch-activate
