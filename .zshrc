# P10k ----------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Theme
antigen theme romkatv/powerlevel10k

# Apply
antigen apply

# P10k ----------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GCP -----------------------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Exa -----------------------------------------------------
alias ls='exa --oneline --group-directories-first'
alias la='exa --all --long --header --group-directories-first --git --time-style long-iso'

# Kubectl -------------------------------------------------
# alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
export KUBECONFIG=~/.kube/config:$(find ~/.kube/*.kubeconfig -type f | tr '\n' ':')

# Brew ----------------------------------------------------
alias buuc='brew update && brew upgrade && brew cleanup'

# Bat -----------------------------------------------------
export BAT_THEME="Dracula"
export BAT_PAGING="always"
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --paging=always'
