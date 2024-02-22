if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
end

set -g fish_greeting ''

#vim
alias vim='nvim'

#python
alias python='python3'

# rust
fish_add_path "~/.cargo/env"

#java
set -gx JAVA_HOME ~/dev/interpreteur_compilateur/java/jdk-21.0.2
fish_add_path $JAVA_HOME/bin

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

#user env
set -gx DEV ~/dev
set -gx DOTFILES ~/.dotfiles

#go
fish_add_path /usr/local/go/bin

#git-but-better
fish_add_path ~/dev/terminal/git-but-better/target/release

#gitui
fish_add_path ~/dev/terminal/gitui/target/release

#podman && docker
alias docker='podman'
alias docker-compose='podman-compose'

#eza
alias ls='eza'
alias ll='eza -la'
alias lsl='eza -la --sort oldest'

#bat
alias cat='bat -p'

#starship
starship init fish | source

#zoxide
builtin cd
fish_add_path ~/.local/bin
zoxide init --cmd cd fish | source
