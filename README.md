<img src="https://simnalamburt.github.io/cgitc/logo.svg"
  align="left" width="160px" height="160px"/>

Close Git Combat
========

> Kept You Waiting, Huh? ― *[Big Boss]*<br>
[![i-license]](/LICENSE)

**cgitc** is set of useful aliases for [fish] shell. It makes you to use git much more faster.

```fish
omf install https://github.com/simnalamburt/cgitc

# FYI, fisher is not 1.0 yet
fisher install simnalamburt/cgitc
```
```
g    = git

gst  = git status
gd   = git diff
gdca = git diff --cached
gc   = git commit -v
gup  = git pull --rebase
glog = git log --oneline --decorate --color --graph
gsta = git stash
gstp = git stash pop
...
```

cgitc is fork of oh-my-zsh's [git plugin].

--------

[MIT License] © [simnalamburt] et [al]

[Big Boss]:       http://metalgear.wikia.com/wiki/Big_Boss
[fish]:           http://fishshell.com
[omf]:            https://github.com/oh-my-fish/oh-my-fish
[git plugin]:     https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
[issue]:          https://github.com/fish-shell/fish-shell/issues/1976

[MIT License]:    https://opensource.org/licenses/MIT
[simnalamburt]:   https://github.com/simnalamburt
[al]:             https://github.com/simnalamburt/cgitc/graphs/contributors

[i-license]:      https://img.shields.io/badge/license-MIT-007EC7.svg
