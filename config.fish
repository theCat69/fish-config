if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
end

#theme
set -g theme_nerd_fonts yes

# if string match $OS_THEME "dark" "Dark" "DARK" 
  #need to do something if dark theme
# else
  #need to do something if light theme
# end

#xclip
alias clip='xclip -selection clipboard'

#vim
alias vim='nvim'
set -gx NVIM_DATA ~/.local/share/nvim

#python
fish_add_path  ~/dev/interpreteur_compilateur/python

# rust
fish_add_path "~/.cargo/env"

#java
set -gx JAVA_HOME ~/dev/interpreteur_compilateur/java/jdk-21.0.2
fish_add_path $JAVA_HOME/bin
set -gx JAVA_RUNTIMES ~/dev/interpreteur_compilateur/java

#maven
set -gx MAVEN_HOME ~/dev/interpreteur_compilateur/maven/apache-maven-3.9.6
fish_add_path $MAVEN_HOME/bin

#groovy
set -gx GROOVY_HOME ~/dev/interpreteur_compilateur/groovy/groovy-4.0.18
fish_add_path $GROOVY_HOME/bin

#gradle
set -gx GRADLE_HOME ~/dev/interpreteur_compilateur/gradle/gradle-8.4
fish_add_path $GRADLE_HOME/bin

#intellij
fish_add_path ~/.local/share/JetBrains/Toolbox/apps/intellij-idea-community-edition/bin
alias ij='idea.sh'

#node
fish_add_path ~/dev/interpreteur_compilateur/node/node-v20.11.1-linux-x64/bin
alias npi='npm install'
alias npid='npm instal --save-dev'

#hardhat
alias hh='npx hardhat'

#user env
set -gx DEV ~/dev
set -gx DOTFILES ~/.dotfiles

#go
fish_add_path /usr/local/go/bin

#git-but-better
fish_add_path ~/dev/terminal/git-but-better/target/release

#gitui
fish_add_path ~/dev/terminal/gitui/target/release

#git aliases
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gr='git rebase'
alias gm='git mergetool'
alias gd='git diff'
alias grm='git rm'
alias ga='git add .'
alias gc='git commit -m'
alias gi='git init'
alias gb='git branch -a'

#podman && docker
alias docker='podman'
alias docker-compose='podman-compose'

#eza
alias ls='eza'
alias ll='eza -la'
alias lsl='eza -la --sort oldest'

#rg
alias grep='rg'

#bat
alias cat='bat --pager=never -p' 
#help with colors
alias bathelp='bat --plain --pager=never --language=help' 
function help
    $argv --help 2>&1 | bathelp
end
#research by file name with preview
alias fzfb='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"' 
#research in file with preview
function rgb 
  rg --line-number --no-heading --color=always --smart-case $argv | fzf -d ":" -n 2.. --ansi --no-sort --preview-window "up:40%:+{2}:~7" --preview "bat --style=numbers --color=always --highlight-line {2} {1}"
end

function misp
  curl -X POST http://localhost:11434/api/generate -d "{
    \"model\": \"mistral\",
    \"prompt\": \"Write in a markdown format. $argv\"
   }" --silent --show-error --no-buffer | jq -s -j '[.][][].response' | nvim -c "set ft=markdown" 
end

#starship
starship init fish | source

#zoxide
fish_add_path ~/.local/bin
zoxide init --cmd cd fish | source


