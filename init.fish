if not set -q cgitc_initialized
  set -U cgitc_initialized
  printf 'Initializing \e[33mcgitc\e[0m ... '

  # (sorted alphabetically)
  abbr g 'git'

  abbr ga 'git add'
  abbr gaa 'git add --all'
  abbr gapa 'git add --patch'

  abbr gb 'git branch'
  abbr gba 'git branch -a'
  abbr gbl 'git blame -b -w'
  abbr gbnm 'git branch --no-merged'
  abbr gbr 'git branch --remote'
  abbr gbs 'git bisect'
  abbr gbsb 'git bisect bad'
  abbr gbsg 'git bisect good'
  abbr gbsr 'git bisect reset'
  abbr gbss 'git bisect start'

  abbr gc 'git commit -v'
  abbr gc! 'git commit -v --amend'
  abbr gca 'git commit -v -a'
  abbr gca! 'git commit -v -a --amend'
  abbr gcan! 'git commit -v -a -s --no-edit --amend'
  abbr gcam 'git commit -a -m'
  abbr gcb 'git checkout -b'
  abbr gcf 'git config --list'
  abbr gcl 'git clone --recursive'
  abbr gclean 'git clean -fd'
  abbr gcm 'git checkout master'
  abbr gcmsg 'git commit -m'
  abbr gco 'git checkout'
  abbr gcount 'git shortlog -sn'
  abbr gcp 'git cherry-pick'
  abbr gcs 'git commit -S'

  abbr gd 'git diff'
  abbr gdca 'git diff --cached'
  abbr gdct 'git describe --tags `git rev-list --tags --max-count=1`'
  abbr gdt 'git diff-tree --no-commit-id --name-only -r'
  abbr gdw 'git diff --word-diff'

  abbr gf 'git fetch'
  abbr gfa 'git fetch --all --prune'
  abbr gfo 'git fetch origin'

  abbr gg 'git gui citool'
  abbr gga 'git gui citool --amend'

  abbr ggpur 'ggu'

  abbr gignore 'git update-index --assume-unchanged'
  abbr gignored 'git ls-files -v | grep "^[[:lower:]]"'

  abbr gk '\gitk --all --branches'

  abbr gl 'git pull'
  abbr glg 'git log --stat --color'
  abbr glgp 'git log --stat --color -p'
  abbr glgg 'git log --graph --color'
  abbr glgga 'git log --graph --decorate --all'
  abbr glgm 'git log --graph --max-count=10'
  abbr glo 'git log --oneline --decorate --color'
  abbr glol "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  abbr glola "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
  abbr glog 'git log --oneline --decorate --color --graph'
  abbr glp "_git_log_prettily"

  abbr gm 'git merge'
  abbr gmom 'git merge origin/master'
  abbr gmt 'git mergetool --no-prompt'
  abbr gmtvim 'git mergetool --no-prompt --tool=vimdiff'
  abbr gmum 'git merge upstream/master'

  abbr gp 'git push'
  abbr gpd 'git push --dry-run'

  abbr gpu 'git push upstream'
  abbr gpv 'git push -v'

  abbr gr 'git remote'
  abbr gra 'git remote add'
  abbr grb 'git rebase'
  abbr grba 'git rebase --abort'
  abbr grbc 'git rebase --continue'
  abbr grbi 'git rebase -i'
  abbr grbm 'git rebase master'
  abbr grbs 'git rebase --skip'
  abbr grh 'git reset HEAD'
  abbr grhh 'git reset HEAD --hard'
  abbr grmv 'git remote rename'
  abbr grrm 'git remote remove'
  abbr grset 'git remote set-url'

  abbr gru 'git reset --'
  abbr grup 'git remote update'
  abbr grv 'git remote -v'

  abbr gsb 'git status -sb'
  abbr gsd 'git svn dcommit'
  abbr gsi 'git submodule init'
  abbr gsps 'git show --pretty=short --show-signature'
  abbr gsr 'git svn rebase'
  abbr gss 'git status -s'
  abbr gst 'git status'
  abbr gsta 'git stash'
  abbr gstaa 'git stash apply'
  abbr gstd 'git stash drop'
  abbr gstl 'git stash list'
  abbr gstp 'git stash pop'
  abbr gsts 'git stash show --text'
  abbr gsu 'git submodule update'

  abbr gts 'git tag -s'
  abbr gtv 'git tag | sort -V'

  abbr gunignore 'git update-index --no-assume-unchanged'

  abbr gup 'git pull --rebase'
  abbr gupv 'git pull --rebase -v'
  abbr glum 'git pull upstream master'

  abbr gvt 'git verify-tag'

  abbr gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

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
