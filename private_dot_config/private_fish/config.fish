fish_add_path ~/.local/bin/
fish_add_path ~/.config/emacs/bin/

export EDITOR="nvim"

if status is-interactive
    pfetch

    alias dotfiles="/usr/bin/env git --git-dir=$HOME/git/dotfiles/.git --work-tree=$HOME/git/dotfiles"
    alias da="dotfiles add"
    alias dc="dotfiles commit -m"
    alias dp="dotfiles push"

    alias t="touch"
end

function ls
    command exa --all --long --group-directories-first --icons $argv
end

function k --wraps=kubecolor
    kubecolor $argv
end

function kns
    kubectl config set-context --current --namespace=$(k get namespaces | fzf --preview='kubectl get all -n {1}' | awk '{print $1}')
end

alias t="tmux"
alias ts="bash ~/.config/tmux/bin/tmux-fzf-sessions"
alias ip="ip --color"
alias can="cd ~/git/homelab/ansible/"
alias ctf="cd ~/git/homelab/terraform/"

function sue
    command sudoedit $argv
end


if status is-interactive
    if test -z "$TMUX"
        if not set -q SSH_CONNECTION
            exec tmux
        end
    end
end

