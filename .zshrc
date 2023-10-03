# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen zsh plugin manager
source /usr/local/share/antigen/antigen.zsh

# Antigen load oh-my-zsh library
antigen use oh-my-zsh

# Antigen oh-my-zsh plugins
antigen bundle history
antigen bundle kubectl
antigen bundle macos
# antigen bundle poetry  # completions
# antigen bundle poetry-env  # auto-load venv when cd-ing into dir with pyproject.toml
# antigen bundle ssh-agent  # auto-start ssh-agent

# Antigen external plugins
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle desyncr/auto-ls
antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# Antigen theme
antigen theme romkatv/powerlevel10k

# Antigen apply
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GCP -----------------------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
alias ls='exa --oneline --group-directories-first'
alias la='exa --all --long --header --group-directories-first --git --time-style long-iso'
# Kubectl -------------------------------------------------
# alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
export KUBECONFIG=~/.kube/config:$(find ~/.kube/*.kubeconfig -type f | tr '\n' ':')
alias buuc='brew update && brew upgrade && brew cleanup'