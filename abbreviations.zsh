gbda                 git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d
gpristine            git reset --hard && git clean -dfx
gdct                 git describe --tags $(git rev-list --tags --max-count=1)
git-svn-dcommit-push git svn dcommit && git push github master:svntrunk
gke                  \gitk --all $(git log -g --pretty=%h)
gpoat                git push origin --all && git push origin --tags
grt                  cd "$(git rev-parse --show-toplevel || echo .)"
gtl                  gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl
gunwip               git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1
gwip                 git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"
