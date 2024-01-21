set pink eb54c6
set teal 54ebc5
set blue 4bb2d3
set light_blue 54c6eb
set magenta a570ff
set green 00ffa5
# set green 83ff70
set grey 808080
set orange FFA500


set fish_color_quote white
set fish_color_cwd 5778c7

set fish_color_command $magenta

# Git Prompt


# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'verbose'
set __fish_git_prompt_color $grey
set __fish_git_prompt_color_flags $pink
set __fish_git_prompt_color_upstream $pink
set __fish_git_prompt_color_branch $light_blue
set __fish_git_prompt_color_upstream_ahead $pink
set __fish_git_prompt_color_upstream_behind $pink

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '▴'
set __fish_git_prompt_char_untrackedfiles '•'
set __fish_git_prompt_char_stashstate 's'
set __fish_git_prompt_char_upstream_ahead '↑ '
set __fish_git_prompt_char_upstream_behind '↓ '
set __fish_git_prompt_char_upstream_diverged '⇵ '

# set __fish_git_prompt_show_informative_status "yes"

# We override this below anyways.
function fish_mode_prompt; end

function fish_prompt
  if [ (uname) != "Darwin" ]
	  set bracket_color "262626"
	  set_color --bold $bracket_color
	  printf '['
	  set_color reset
	  set_color $orange
	  printf '%s' (hostname | cut -d "." -f 1)
	  set_color --bold $bracket_color
	  printf '] '
  end

  set last_status $status
	switch $fish_bind_mode
		case default
			printf "%sN" (set_color --bold blue)
		case insert
			printf "%sI" (set_color --bold green)
		case visual
			printf "%sV" (set_color --bold yellow)
		case replace_one
			printf "%sR" (set_color --bold red)
		case "*"
			printf "%sn" (set_color --bold normal)
	end
  set_color -o
  set_color $fish_color_cwd
  printf ' %s' (prompt_pwd)
  set_color normal

  set git_prompt (__fish_git_prompt)
  printf '%s' $git_prompt
  if test -z "$git_prompt"
	# Avoids performance penalty of sl_prompt startup.
  	sl_prompt
  end
  printf ' '

  set_color normal
end

# autojump
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

set autojump_preload "/usr/share/autojump/autojump.fish"
if test -e $autojump_preload
	source $autojump_preload
end

# git aliases
alias gpo='git push -u origin HEAD'
alias gpof='git push --force -u origin HEAD'
alias g='git'
alias gd='git diff HEAD'

alias l='ls -al'

# google cloud aliases
alias gcssh="gcloud compute ssh"

alias we="watchexec -r -c --"

# Set special PATH

function add_path -a dir
  if test -d $dir
    set PATH $dir $PATH
  end
end

add_path /usr/local/opt/findutils/libexec/gnubin
add_path /usr/local/opt/make/libexec/gnubin

add_path ~/Projects/ammario/dotfiles/bin
add_path ~/Projects/dotfiles/bin
add_path ~/dotfiles/bin
add_path ~/m/devbin
add_path ~/c/devbin
add_path ~/go/bin
add_path ~/bin
add_path ~/.cargo/bin
add_path /usr/local/opt/ruby/bin
add_path ~/.airplane/bin
add_path ~/.local/bin
add_path /usr/local/bin/
set fish_greeting ""
set GOPATH ~/go
set GO111MODULE on

# Custom keybinds
# See https://fishshell.com/docs/current/commands.html#bind for syntax reference.
# See https://github.com/fish-shell/fish-shell/blob/23ba7b5bfff9393d222cd8e4a045e3439e24aba1/share/functions/fish_default_key_bindings.fish for default bindings.
fish_vi_key_bindings

function fish_user_key_bindings
	bind -M insert \ea accept-autosuggestion execute
	bind -M insert \ee accept-autosuggestion 
	bind -M insert \ew nextd-or-forward-word
end

set EDITOR (which nvim)
set KUBE_EDITOR $EDITOR
set VISUAL nvim
alias v="nvim"
alias vim="nvim"
alias c="clear"

# Let GPG prompt for password.
# See https://stackoverflow.com/a/42265848
set -x GPG_TTY (tty)

if test -f /Users/ammar/.autojump/share/autojump/autojump.fish; . /Users/ammar/.autojump/share/autojump/autojump.fish; end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ammar/google-cloud-sdk/path.fish.inc' ]; . '/Users/ammar/google-cloud-sdk/path.fish.inc'; end

set SHELL (which fish)

if which exa > /dev/null
	alias ls="exa"
end

function edit_cmd --description 'Input command in external editor'
	set -l f (mktemp /tmp/fish.cmd.XXXXXXXX)
	if test -n "$f"
	    set -l p (commandline -C)
	    commandline -b > $f
	    $EDITOR -c 'set ft=fish' $f
	    commandline -r (cat $f)
	    commandline -C $p
	    command rm $f
	end
end

bind \cE edit_cmd

if which bat > /dev/null
	alias cat="bat"
end

# Not sure how this keeps getting set.
set -e GITHUB_TOKEN


# Helpful when working across multiple machines.
export TZ='America/Chicago'
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opam configuration
source /Users/ammar/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# disable GOPROXY while Go is broken in dogfood
#
set --export GOPROXY ""
