<h1 align=center>
  <img alt="Close Git Combat" src="https://simnalamburt.github.io/cgitc/emblem.svg">
</h1>

**cgitc** is set of useful git aliases for [bash], [zsh] and [fish]. It provides
professional and swift git usage.

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

cgitc is fork of [oh-my-zsh]'s [git plugin].
<br><br>

Installation
--------
You can install cgitc via various package managers.

#### Bash
```bash
git clone https://github.com/simnalamburt/cgitc.git --depth=1 ~/.cgitc &&\
  echo 'source ~/.cgitc/init.bash' >> ~/.bashrc
```
#### Zsh, [zplug]
```zsh
zplug "simnalamburt/cgitc"
```

#### Fish, [chips]
```yaml
# Update your '~/.config/chips/plugin.yaml'
github:
- simnalamburt/cgitc
```

#### Fish, [oh-my-fish]
```fish
omf install https://github.com/simnalamburt/cgitc
```

<br>

--------
*cgitc* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. *cgitc emblem* © 2017 [XT]. See
[COPYRIGHT] for details.

[bash]: https://www.gnu.org/software/bash/
[zsh]: https://www.zsh.org
[fish]: https://fishshell.com
[zplug]: https://github.com/zplug/zplug
[chips]: https://github.com/xtendo-org/chips
[oh-my-fish]: https://github.com/oh-my-fish/oh-my-fish
[oh-my-zsh]: http://ohmyz.sh
[git plugin]: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
[XT]: https://e.xtendo.org/
