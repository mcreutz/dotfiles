# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Brew completions ---------------------------------------
# Must be before oh-my-zsh.sh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Antigen -------------------------------------------------
# Zsh plugin manager
source $(brew --prefix)/share/antigen/antigen.zsh
# Load oh-my-zsh library
antigen use oh-my-zsh
# Oh-my-zsh plugins
antigen bundle history
antigen bundle kubectl
antigen bundle macos
# antigen bundle poetry  # completions
# antigen bundle poetry-env  # auto-load venv when cd-ing into dir with pyproject.toml
# antigen bundle ssh-agent  # auto-start ssh-agent
# External plugins
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle desyncr/auto-ls
antigen bundle zsh-users/zsh-syntax-highlighting  # must be last plugin
# Apply
antigen apply

# GCP -----------------------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Fzf -----------------------------------------------------
# run '$(brew --prefix)/opt/fzf/install' after fzf installation to enable fzf autocompletion
source <(fzf --zsh)

# History -----------------------------------------------------
alias history="history -i"  # add timestamps to output

# Eza -----------------------------------------------------
alias ls='eza --oneline --group-directories-first'
alias la='eza --all --all --long --header --group-directories-first --git --time-style long-iso'

# Kubectl -------------------------------------------------
# Autocompletion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
# Aliases
# Assumption is, that each context has its own .kubeconfig file.
# When minikube creates a 'config' file, check that it contains nothing else and rename it to 'minikube.kubeconfig'
# Select context with fzf (~/.kube/*.kubeconfig files)
alias kc='export KUBECONFIG=~/.kube/$(find ~/.kube/*.kubeconfig -type f -exec basename {} .kubeconfig "'";"'" | fzf).kubeconfig'
alias kcu="export KUBECONFIG=\"\""  # unset
# Select default namespace with fzf
alias kn='kubectl config set-context --current --namespace=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf)'
alias knu="kubectl config set-context --current --namespace=\"\""  # unset

# Brew ----------------------------------------------------
# update and upgrade
alias buu='brew update && brew upgrade && brew autoremove && brew cleanup'

# Bat -----------------------------------------------------
export BAT_THEME="Dracula"
export BAT_PAGING="always"
# Highlight --help texts
# alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --paging=always'

# Multipass -----------------------------------------------------
alias mp="multipass"

# Poetry -----------------------------------------------------
# list all environments
alias ple="ls ~/Library/Caches/pypoetry/virtualenvs"

# git -----------------------------------------------------
# git switch with fzf
alias gs='git switch $(git branch | fzf)'

# Added by LM Studio CLI (lms) -----------------------------------------------------
export PATH="$PATH:/Users/martin/.cache/lm-studio/bin"
export PATH="$PATH:/Users/martin/.lmstudio/bin"


# Starship -----------------------------------------------------
eval "$(starship init zsh)"  # should be at the end of the file
