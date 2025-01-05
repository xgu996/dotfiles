# Zsh Options
setopt HIST_IGNORE_ALL_DUPS
bindkey -v # Set default keymap to vi
WORDCHARS=${WORDCHARS//[\/]} # Remove path separator from WORDCHARS

# ------------------
# Initialize Modules
# ------------------
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw plugin manager if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install and initialize Zim modules
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# History substring search
zmodload -F zsh/terminfo +p:terminfo
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

# ------------------
# Aliases
# ------------------
alias proxy="export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890;export ALL_PROXY=socks5://127.0.0.1:7890"
alias unproxy="unset http_proxy;unset https_proxy;unset ALL_PROXY"
alias vi="nvim"
alias vim="nvim"
alias reload="source ~/.zshrc"
alias ra="yazi"
alias lc='colorls -lA --sd'

# ------------------
# Environment Variables
# ------------------
export TERM=xterm-256color
export EDITOR=nvim
export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8

# ------------------
# Compiler and Tools
# ------------------
export CC=/opt/homebrew/Cellar/llvm/17.0.6_1/bin/clang

# ------------------
# Netgen Initialization
# ------------------
export PYTHONPATH=/Users/biubiu/anaconda3/envs/ng/lib/python3.8/site-packages.
export NETGENDIR=/Applications/Netgen.app/Contents/MacOS
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$NETGENDIR
export DYLD_FRAMEWORK_PATH=$DYLD_FRAMEWORK_PATH:$NETGENDIR/../Frameworks
export PATH=$NETGENDIR:/opt/homebrew/bin:$PATH

# ------------------
# Conda Initialization
# ------------------
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/biubiu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/biubiu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/biubiu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/biubiu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# ------------------
# TeXLive Initialization
# ------------------
export PATH=$PATH:/usr/local/texlive/2023/bin/universal-darwin
export MANPATH=$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info

# ------------------
# FZF Integration
# ------------------
source <(fzf --zsh)
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top --bind ctrl-e:down,ctrl-u:up'
# CTRL-/ to show preview window which is hidden by default
export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='fd'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

# ------------------
# Oh My Posh
# ------------------
eval "$(oh-my-posh init zsh --config ~/kali.omp.json)"

# ------------------
# NVM Initialization
# ------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ------------------
# Nix Daemon
# ------------------
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
