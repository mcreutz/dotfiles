# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen zsh plugin manager
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins with oh-my-zsh
antigen bundle history
antigen bundle kubectl
antigen bundle macos
# antigen bundle poetry  # completions
# antigen bundle poetry-env  # auto-load venv when cd-ing into dir with pyproject.toml
# antigen bundle ssh-agent  # auto-start ssh-agent

# external plugins
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle desyncr/auto-ls
antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# theme
antigen theme romkatv/powerlevel10k

# apply config
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias ls='exa --oneline --group-directories-first'
alias la='exa --all --long --header --group-directories-first --git --time-style long-iso'
# alias k='kubectl'
alias kc='kubectx'
alias kn='kubens'
alias buuc='brew update && brew upgrade && brew cleanup'