# name: maxz-fish

# function _git_branch_name
#   echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
# end

# function _is_git_dirty
#   set -l show_untracked (git config --bool bash.showUntrackedFiles)
#   set -l untracked
#   if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
#     set untracked '--untracked-files=no'
#   end
#   echo (command git status -s --ignore-submodules=dirty $untracked 2> /dev/null)
# end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  # adds user@hostname if on ssh connection
  if test -n "$SSH_CONNECTION"
    set host "$cyan$USER@$blue$hostname "
  end

  if test $last_status = 0
      set prompt_color $green 
  else
      set prompt_color $red
  end

  # if [ (_git_branch_name) ]
  #   set -l git_branch $red(_git_branch_name)
  #   set git_info "$blue $git_branch$blue"

  #   if [ (_is_git_dirty) ]
  #     set -l dirty "$yellow ✗"
  #     set git_info "$git_info$dirty"
  #   end
  # end

  echo -n -s $host ' ' $yellow $prompt_pwd$prompt_color$normal ' '
end
