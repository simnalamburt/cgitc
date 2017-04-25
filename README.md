Close Git Combat
========
**cgitc** is set of useful git aliases for bash, [zsh] and [fish]. It provides professional and swift git usage.
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

(etc)
```

```shell
# bash (apppend the second line into your `.bashrc`)
git clone https://github.com/simnalamburt/cgitc.git --depth=1 ~/.cgitc
source ~/.cgitc/init.bash

# zsh using https://github.com/zplug/zplug
zplug "simnalamburt/cgitc"

# fish
omf install https://github.com/simnalamburt/cgitc
```

cgitc is fork of oh-my-zsh's [git plugin].

--------

[MIT License] © [simnalamburt] et [al]

[Big Boss]:       http://metalgear.wikia.com/wiki/Big_Boss
[zsh]:            https://github.com/zplug/zplug
[fish]:           http://fishshell.com
[omf]:            https://github.com/oh-my-fish/oh-my-fish
[git plugin]:     https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
[issue]:          https://github.com/fish-shell/fish-shell/issues/1976

[MIT License]:    https://opensource.org/licenses/MIT
[simnalamburt]:   https://github.com/simnalamburt
[al]:             https://github.com/simnalamburt/cgitc/graphs/contributors
