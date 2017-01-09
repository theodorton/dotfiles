# Path to Oh My Fish install.
set -gx OMF_PATH /Users/theodorton/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/theodorton/.config/omf

# Aliases
balias gs 'git status'
balias ga 'git add'
balias gb 'git branch'
balias gc 'git commit'
balias gco 'git checkout'
balias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
balias gd 'git diff'
balias gp 'git push'
balias gpc 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
balias gpf 'git push --force'
balias gpt 'git push --tags'
balias gss 'git stash save'
balias gsp 'git stash pop'
alias gt 'gittower .'

balias rb 'ruby'
balias rbb 'bundle'
balias rbbe 'bundle exec'
balias rbbu 'bundle update'
balias rbbo 'bundle outdated'

balias hb 'homebrew'

# Some of these override other binaries
balias d 'docker'
balias dk 'docker kill'
balias dc 'docker-compose'
balias dcb 'docker-compose build'
balias dcu 'docker-compose up'
balias dcr 'docker-compose rm'
balias dm 'docker-machine'
balias dme 'docker-machine env'

# Fasd
function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

function j
  cd (fasd -d -e 'printf %s' "$argv")
end

# Rbenv
status --is-interactive; and . (rbenv init -|psub)

# Direnv
eval (direnv hook fish)

# Crenv
set PATH $HOME/.crenv/bin $PATH
# eval (crenv init -)

# Android Home
export ANDROID_HOME=/usr/local/opt/android-sdk

# Editors
export BUNDLER_EDITOR=atom
export REACT_EDITOR=atom

# Google Cloud SDK Settings
set MANPATH /usr/local/share/man /usr/share/man /opt/x11/share/man
set PATH /usr/local/sbin $PATH
set PATH /Users/theodorton/Qt5.5.1/5.5/clang_64/bin $PATH
# set PATH /usr/local/opt/gnupg/libexec/gpgbin $PATH
# set PATH /usr/local/opt/go/libexec/bin $PATH
set GOPATH $HOME/code/go
export GOPATH
