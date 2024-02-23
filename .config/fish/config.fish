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

alias yo 'yarn outdated'

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
    # Download https://endoflife.date/api/$argv.json and store response in a local variable
    set response (curl --silent https://endoflife.date/api/$argv.json)

    # Find all objects where lts is a string, and convert to a JSON array
    set lts (echo $response | jq 'map(select(.lts | type == "string"))')

    # Check if lts is an empty array with JQ
    if test (echo $lts | jq 'length') -gt 0
      echo $lts | jq '.[0]'
    else
      # Otherwise, print the first object in the response
      echo $response | jq '.[0]'
    end
  else
    # print a newline
    echo
  end
end

# If ~/.config/fish/eol_cache.json exists, and it's older than 1 day, delete it
if test -e ~/.config/fish/eol_cache.json
  and test (date -r ~/.config/fish/eol_cache.json +%s) -lt (math (date +%s) - 86400)
  and rm ~/.config/fish/eol_cache.json
end

# If ~/.config/fish/eol_cache.json does not exist, or it's empty, create it by downloading from https://endoflife.date/api/all.json
if not test -e ~/.config/fish/eol_cache.json
  or test -z (cat ~/.config/fish/eol_cache.json)
  and curl --silent https://endoflife.date/api/all.json > ~/.config/fish/eol_cache.json
end

# Add completions for eol function - use  returns an array with possible values
complete -c eol -a '(cat ~/.config/fish/eol_cache.json | jq -r '.[]')' -f

# Also disable the file completion for this command
complete -c eol -n '__fish_use_subcommand' -a 'all' -f

function pull -d "Clone a GitHub repository to ~/code/clones and change directory"
  if test -z "$argv"
    echo "Usage: pull <username> <repo>"
    return 1
  end

  # Set a local repo variable with first and second argument joined by /
  set repo $argv[1]/$argv[2]

  curl --silent --fail https://github.com/$repo > /dev/null
  if test $status -ne 0
    echo "Repo $repo unavailable"
    return 1
  end

  mkdir -p ~/code/clones/$repo
  and git clone -v git@github.com:$repo.git ~/code/clones/$repo
  and cd ~/code/clones/$repo
end

function _fetch_repos_for_username
    # Check if we are at the second argument position.
    set -l cmd (commandline -opc)
    if count $cmd = 2
        set -l username $cmd[2]
        gh repo list $username --limit 100 --json name | jq -r '.[].name'
    end
end

function _is_gh_clone_with_one_arg
    set -l cmd (commandline -opc)
    # Return true (status 0) if the command is pull and exactly one argument is provided
    test (count $cmd) = 2; and test $cmd[1] = 'pull'
end

complete -c pull -n '_is_gh_clone_with_one_arg' -xa '(_fetch_repos_for_username)' -f

function run\-stashed -d "Stash changes and run a command"
  git stash save --quiet -uk
  and $argv
  git stash pop --quiet
end
