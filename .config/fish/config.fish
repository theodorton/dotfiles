if status is-interactive
    # Commands to run in interactive sessions can go here
    # source ~/.asdf/asdf.fish

    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end

# THEME PURE #
# set fish_function_path /Users/theodorton/.config/fish/functions/theme-pure/functions/ $fish_function_path
# source /Users/theodorton/.config/fish/functions/theme-pure/conf.d/pure.fish
# set --universal pure_show_system_time false

alias rbb 'bundle'
alias rbbe 'bundle exec'
alias rbbu 'bundle update'
alias rbbo 'bundle outdated'
alias rbba 'bundle add'

# Aliases
alias gs 'git status'
alias ga 'git add'
alias gf 'git fetch'
alias gu 'git pull'
alias gb 'git branch'
alias gc 'git commit'
alias gco 'git checkout'
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --abbrev=7"
alias gd 'git diff'
alias gp 'git push'
alias gpc 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
alias gpf 'git push --force'
alias gpt 'git push --tags'
alias gss 'git stash save -uk'
alias gsp 'git stash pop'
alias grb 'git rebase'
alias grc 'git rebase --continue'

function j
  cd (fasd -sdi "$argv")
end

# Yarn global binaries
set -gx PATH "/Users/theodorton/.yarn/bin" $PATH;

# Rust
set -gx PATH "/Users/theodorton/.cargo/bin" $PATH;

set RUSTUP_HOME "/Users/theodorton/.rustup"
set CARGO_HOME "/Users/theodorton/.cargo"

# GOLANG configurations
set -x GOPATH $HOME/golang
set -x GOROOT /opt/homebrew/opt/go/libexec
set PATH $GOPATH/bin $GOROOT/bin $PATH

function fish_right_prompt -d "Write out the right prompt"
  # noop
end

source ~/.iterm2_shell_integration.fish

# Flutter
set -x FLUTTER_ROOT (asdf where flutter)

# Fix completions for flyctl
alias fly 'flyctl'

function eol -d "Prints the end of life for a given programming language or software package"
  # if the argument is not empty
  if test -n "$argv"
    curl --silent  https://endoflife.date/api/$argv.json | jq '.[0]'
  else
    # print a newline
    echo
  end
end
