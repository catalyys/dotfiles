fish_add_path ~/.local/bin/

export EDITOR="helix"

if status is-interactive
    pfetch

    alias dotfiles="/usr/bin/env git --git-dir=$HOME/git/dotfiles/.git --work-tree=$HOME/git/dotfiles"
    alias da="dotfiles add"
	alias dc="dotfiles commit -m"
	alias dp="dotfiles push"

	alias hx="helix"
    alias t="touch"
end

set SUDO_EDITOR /usr/bin/helix
export SUDO_EDITOR

function ls
    command exa --all --long --group-directories-first --icons $argv
end

function k --wraps=kubecolor
    kubecolor $argv
end

function sue
    command sudoedit $argv
end
