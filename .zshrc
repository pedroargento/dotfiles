
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export EDITOR=nvim
export DOCKER_HOST=unix:///var/run/docker.sock
export PATH="$HOME/go/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias six='echo "(5 + 1)" | bc | xclip -selection clipboard'
alias ab="cartesi address-book | fzf | awk '{print $2}'"

export PATH="/home/pedroargento/git-fuzzy/bin:$PATH"
export PATH="$HOME/projects/scripts:$PATH"
export PATH="$HOME/Downloads/cartesi-machine/:$PATH"


autoload -U compinit
compinit -i


# pnpm
export PNPM_HOME="/home/pedroargento/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
