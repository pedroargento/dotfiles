if status is-interactive
    # Commands to run in interactive sessions can go here
    fish-vi-key_bindings
    alias gch="git checkout (git branch | fzf| tr -d ‘[:space:]’)"
    alias ctsi="seth --to-fix 18 (seth call 0x8F57aE7DdDe63412509E71997B2438a3E6dcB763 'sharesToAmount(uint)(uint)' (seth call 0x8F57aE7DdDe63412509E71997B2438a3E6dcB763 'userBalance(address)(uint,uint,uint)' 0x94d9Bdb6340e031afBcE2ac5C66fb687D909e119 | sed -n '2p'))"
    alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
end
set -x PATH (pwd)"/git-fuzzy/bin:$PATH"
set -gx EDITOR nvim

export PATH="$PATH:/home/pedroargento/.foundry/bin"
