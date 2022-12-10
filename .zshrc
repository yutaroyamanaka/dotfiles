setopt IGNOREEOF

# -----------------------------
# GO SETTING
# -----------------------------
GOPATH=$(go env GOPATH)
path+=($GOPATH/bin)

# -----------------------------
# PYTHON SETTING
# -----------------------------
PYTHON_VERSION=$(python3 --version | awk '{print $2}')

autoload -Uz colors
colors

setopt share_history
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd
setopt auto_pushd
setopt mark_dirs
setopt correct

alias ll="ls -la"
alias his="history"
alias vim="nvim"
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias dps='docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
alias de='docker exec -it `dps | peco | cut -f 1` /bin/bash'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias kc='kubectl-ctx | peco | xargs kubectl-ctx'

cdpath=(~)

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion::complete:*' use-cache true
bindkey '^s' history-incremental-pattern-search-forward
zstyle ':zle:*' word-style unspecified

function select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N select-history
bindkey '^r' select-history

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# -----------------------------
# Plugin
# -----------------------------
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

zplug load --verbose

# -----------------------------
# git
# -----------------------------
zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit

# -----------------------------
# PROMPT
# -----------------------------
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT="${fg[yellow]} %~"
PROMPT=$PROMPT' ${vcs_info_msg_0_}'
PROMPT="$PROMPT
%# "

# -----------------------------
# asdf
# -----------------------------
. /usr/local/opt/asdf/libexec/asdf.sh

# -----------------------------
# k8s
# -----------------------------
path+=(${KREW_ROOT:-$HOME/.krew}/bin)
source <(kubectl completion zsh)

# -----------------------------
# neofetch
# -----------------------------
neofetch
