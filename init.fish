function __cgitc_abbreviations
  # Abbreviations sorted in alphabetically
  echo "
g             git

ga            git add
gaa           git add --all
gapa          git add --patch

gb            git branch
gba           git branch -a
gbl           git blame -b -w
gbnm          git branch --no-merged
gbr           git branch --remote
gbs           git bisect
gbsb          git bisect bad
gbsg          git bisect good
gbsr          git bisect reset
gbss          git bisect start

gc            git commit -v
gc!           git commit -v --amend
gca           git commit -v -a
gca!          git commit -v -a --amend
gcan!         git commit -v -a -s --no-edit --amend
gcam          git commit -a -m
gcb           git checkout -b
gcf           git config --list
gcl           git clone --recursive
gclean        git clean -fd
gcm           git checkout master
gcmsg         git commit -m
gco           git checkout
gcount        git shortlog -sn
gcp           git cherry-pick
gcs           git commit -S

gd            git diff
gdca          git diff --cached
gdct          git describe --tags `git rev-list --tags --max-count=1`
gdt           git diff-tree --no-commit-id --name-only -r
gdw           git diff --word-diff

gf            git fetch
gfa           git fetch --all --prune
gfo           git fetch origin

gg            git gui citool
gga           git gui citool --amend

ggpur         ggu

gignore       git update-index --assume-unchanged
gignored      git ls-files -v | grep "^[[:lower:]]"

gk            \gitk --all --branches

gl            git pull
glg           git log --stat --color
glgp          git log --stat --color -p
glgg          git log --graph --color
glgga         git log --graph --decorate --all
glgm          git log --graph --max-count=10
glo           git log --oneline --decorate --color
glol          git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
glola         git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all
glog          git log --oneline --decorate --color --graph
glp           _git_log_prettily # TODO: Implement

gm            git merge
gmom          git merge origin/master
gmt           git mergetool --no-prompt
gmtvim        git mergetool --no-prompt --tool=vimdiff
gmum          git merge upstream/master

gp            git push
gpd           git push --dry-run

gpu           git push upstream
gpv           git push -v

gr            git remote
gra           git remote add
grb           git rebase
grba          git rebase --abort
grbc          git rebase --continue
grbi          git rebase -i
grbm          git rebase master
grbs          git rebase --skip
grh           git reset HEAD
grhh          git reset --hard HEAD
grmv          git remote rename
grrm          git remote remove
grset         git remote set-url

gru           git reset --
grup          git remote update
grv           git remote -v

gsb           git status -sb
gsd           git svn dcommit
gsi           git submodule init
gsps          git show --pretty=short --show-signature
gsr           git svn rebase
gss           git status -s
gst           git status
gsta          git stash
gstaa         git stash apply
gstd          git stash drop
gstl          git stash list
gstp          git stash pop
gsts          git stash show --text
gsu           git submodule update

gts           git tag -s
gtv           git tag | sort -V

gunignore     git update-index --no-assume-unchanged

gup           git pull --rebase
gupv          git pull --rebase -v
glum          git pull upstream master

gvt           git verify-tag

gwch          git whatchanged -p --abbrev-commit --pretty=medium
"
end

# Skip if $cgitc_initialized is set
if not set -q cgitc_initialized
  printf 'Initializing \e[33mcgitc\e[0m ... '
  for line in (__cgitc_abbreviations)
    # 1.  Strip out comments
    # 2.  Squeeze repeating spaces
    # 3.  Strip trailing whitespaces
    set line (echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/[[:space:]]*$//')

    # Skip empty lines
    if not [ "$line" ]; continue; end

    # Parse lines
    set key   (echo "$line" | cut -d ' ' -f 1)
    set value (echo "$line" | cut -d ' ' -f 2-)

    abbr $key $value
  end

  set -U cgitc_initialized
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
