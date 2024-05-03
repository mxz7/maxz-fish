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
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)
  set -l magenta (set_color magenta)
  set -l hostname_short (hostname -s)

  set prompt_char '$'

  if fish_is_root_user
    set prompt_char '#'
  end

  # adds user@hostname if on ssh connection
  if test -n "$SSH_CONNECTION"
    set host "$cyan$USER$normal@$blue$hostname_short "
  else
    set host "$cyan$USER "
  end

  if test $last_status = 0
      set prompt_color $normal 
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

  echo -n -s $host $yellow (prompt_pwd) $prompt_color $prompt_char $normal ' '
end
