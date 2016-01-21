if not set -q cgitc_initialized
  set -U cgitc_initialized

  printf 'Initializing \e[33mcgitc\e[0m ... '
  for line in (cat (dirname (status -f))/abbreviations)
    # 1.  Strip out comments
    # 2.  Squeeze repeating spaces
    # 3.  Strip trailing whitespaces
    set line (echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/\s*$//')

    # Skip empty lines
    if not [ "$line" ]; continue; end

    # Parse lines
    set key   (echo "$line" | cut -d ' ' -f 1)
    set value (echo "$line" | cut -d ' ' -f 2-)

    abbr $key $value
  end
  echo 'Done'
end


# TODO: Port aliases below

# Query/use custom command for `git`.
# zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
# : ${_omz_git_git_cmd:=git}

#
# Functions
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
# function current_branch() {
#   git_current_branch
# }
# The list of remotes
# function current_repository() {
#   if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
#     return
#   fi
#   echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
# }
# Pretty log messages
# function _git_log_prettily(){
#   if ! [ -z $1 ]; then
#     git log --pretty=$1
#   fi
# }
# Warn if the current branch is a WIP
# function work_in_progress() {
#   if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
#     echo "WIP!!"
#   fi
# }


# alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'
# alias gpristine='git reset --hard && git clean -dfx'
# compdef gcount=git
# gdv() { git diff -w "$@" | view - }
# compdef _git gdv=git-diff
# function gfg() { git ls-files | grep $@ }
# compdef gfg=grep
# ggf() {
# [[ "$#" != 1 ]] && local b="$(git_current_branch)"
# git push --force origin "${b:=$1}"
# }
# compdef _git ggf=git-checkout
# ggl() {
# if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
# git pull origin "${*}"
# else
# [[ "$#" == 0 ]] && local b="$(git_current_branch)"
# git pull origin "${b:=$1}"
# fi
# }
# compdef _git ggl=git-checkout
# alias ggpull='git pull origin $(git_current_branch)'
# compdef _git ggpull=git-checkout
# ggp() {
# if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
# git push origin "${*}"
# else
# [[ "$#" == 0 ]] && local b="$(git_current_branch)"
# git push origin "${b:=$1}"
# fi
# }
# compdef _git ggp=git-checkout
# alias ggpush='git push origin $(git_current_branch)'
# compdef _git ggpush=git-checkout
# ggpnp() {
# if [[ "$#" == 0 ]]; then
# ggl && ggp
# else
# ggl "${*}" && ggp "${*}"
# fi
# }
# compdef _git ggpnp=git-checkout
# alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
# ggu() {
# [[ "$#" != 1 ]] && local b="$(git_current_branch)"
# git pull --rebase origin "${b:=$1}"
# }
# compdef _git ggu=git-checkout
# compdef _git ggpur=git-checkout

# alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
# compdef git-svn-dcommit-push=git

# compdef _git gk='gitk'
# alias gke='\gitk --all $(git log -g --pretty=format:%h)'
# compdef _git gke='gitk'

# compdef _git glp=git-log

# alias gpoat='git push origin --all && git push origin --tags'
# compdef _git gpoat=git-push

# alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

# alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'
