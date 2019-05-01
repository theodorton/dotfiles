# Path to Oh My Fish install.
# set -gx OMF_PATH /Users/theodorton/.local/share/omf

# Customize Oh My Fish configuration path.
# set -gx OMF_CONFIG /Users/theodorton/.config/omf

# Aliases
alias gs 'git status'
alias ga 'git add'
alias gf 'git fetch'
alias gu 'git pull'
alias gb 'git branch'
alias gc 'git commit'
alias gco 'git checkout'
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd 'git diff'
alias gp 'git push'
alias gpc 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
alias gpf 'git push --force'
alias gpt 'git push --tags'
alias gss 'git stash save'
alias gsp 'git stash pop'
alias gt 'gittower .'

alias rb 'ruby'
alias rbb 'bundle'
alias rbbe 'bundle exec'
alias rbbu 'bundle update'
alias rbbo 'bundle outdated'

alias hb 'homebrew'

alias k 'kubectl'

alias atom 'code'

# Some of these override other binaries
alias d 'docker'
alias dk 'docker kill'
alias dc 'docker-compose'
alias dcb 'docker-compose build'
alias dcu 'docker-compose up'
alias dcr 'docker-compose rm'
alias dm 'docker-machine'
alias dme 'docker-machine env'

alias octave '/usr/local/octave/3.8.0/bin/octave-3.8.0'

alias dokku '/Users/theodortonum/code/hobby/dokku/contrib/dokku_client.sh'

alias flushdns 'sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

function j
  cd (fasd -sdi "$argv")
end

# Rbenv
status --is-interactive; and . (rbenv init -|psub)

# Nodenv
status --is-interactive; and . (nodenv init -|psub)

# Crenv
# set PATH $HOME/.crenv/bin $PATH
# eval (crenv init -)

# Android Home
export ANDROID_HOME=/usr/local/share/android-sdk

# Editors
export BUNDLER_EDITOR=atom
export REACT_EDITOR=atom
export KUBE_EDITOR="atom --wait"

# yarn
set PATH $PATH $HOME/.config/yarn/global/node_modules/.bin

# postgres.app
set -x PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# Misc
# set PATH ~/anaconda2/bin $PATH
# set PATH /usr/local/opt/gnupg/libexec/gpgbin $PATH
# set PATH /usr/local/opt/go/libexec/bin $PATH

# Fastlane
set -x PATH $HOME/.fastlane/bin $PATH
set -g fish_user_paths "/usr/local/opt/elasticsearch@2.4/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig
set -gx PKG_CONFIG_PATH "/usr/local/opt/ncurses/lib/pkgconfig" $PKG_CONFIG_PATH

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -g fish_user_paths "/usr/local/opt/mozjpeg/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -x PATH $HOME/code/hobby/shards/bin $PATH
export DOKKU_HOST=dokku.konteiner.io

set -gx LDFLAGS "-L/usr/local/opt/ncurses/lib"
set -gx CPPFLAGS "-I/usr/local/opt/ncurses/include"
set -g fish_user_paths "/usr/local/opt/e2fsprogs/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/e2fsprogs/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

# Curl
# set -gx PKG_CONFIG_PATH "/usr/local/opt/curl/lib/pkgconfig"
# set -gx LDFLAGS "-L/usr/local/opt/curl/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/curl/include"
# set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

# Crystal OpenSSL
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

# Rust
source $HOME/.cargo/env

cd ./
