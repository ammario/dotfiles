
set pink eb54c6
set teal 54ebc5
set blue 4bb2d3
set light_blue 54c6eb
set magenta a570ff
set green 83ff70
set grey 808080


set fish_color_quote white
set fish_color_cwd $green
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
  printf '%s ' (__fish_git_prompt)

  set_color normal
end

# autojump
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

# git aliases
alias gpo='git push -u origin HEAD'
alias gpof='git push --force -u origin HEAD'
alias glog='git log --oneline --decorate --graph'

# google cloud aliases
alias gcssh="gcloud compute ssh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ammar/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/home/ammar/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/home/ammar/Downloads/google-cloud-sdk/path.fish.inc'; end; end

# Set special PATH
set PATH $PATH ~/go/bin ~/bin ~/Projects/coder/bin
set fish_greeting ""
set GOPATH ~/go

# VIM MODE!
fish_vi_key_bindings
