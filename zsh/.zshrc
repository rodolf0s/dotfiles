HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HIST_STAMPS="yyyy-mm-dd"
setopt SHARE_HISTORY


# ALIAS
alias dcl="docker container ls --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.CreatedAt}}'"
alias kubectl=kubecolor
alias k="kubecolor"
alias ls='gls --group-directories-first --color=auto'
alias ll='ls -l --color=auto'


# LOAD APPS && TOOLS
source /opt/homebrew/opt/zinit/zinit.zsh


# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# NODEJS
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# PATHS
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/rodolfo.santander/go/bin:$PATH"


# GCP
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"


# zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search
zinit light greymd/docker-zsh-completion
zinit load mbhynes/fzf-gcloud
zinit snippet OMZP::colored-man-pages
zinit light junegunn/fzf-git.sh

# BINDING KEYS
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line


# K8S && KUBECTL
source <(kubectl completion zsh)
alias k=kubecolor
compdef kubecolor=kubectl

# STARSHIP
eval "$(starship init zsh)"

# FZF running: $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
