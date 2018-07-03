set -g -x fish_greeting ''

# Colors

set pink eb54c6
set teal 54ebc5
set blue 4bb2d3
set light_blue 54c6eb

set fish_color_cwd $blue

# Git Prompt


# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'verbose'
set __fish_git_prompt_color $pink
set __fish_git_prompt_color_branch $light_blue
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '▴'
set __fish_git_prompt_char_untrackedfiles 'u*'
set __fish_git_prompt_char_stashstate 's'
set __fish_git_prompt_char_upstream_ahead '▵'
set __fish_git_prompt_char_upstream_behind '▿'

# set __fish_git_prompt_show_informative_status "yes"


function fish_prompt
  set last_status $status

  set_color -o
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
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

# git alias
alias gpo='git push -u origin HEAD'
alias gpof='git push --force -u origin HEAD'
