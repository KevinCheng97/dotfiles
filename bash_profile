alias ..='cd ..'
alias lm="ls -l. | more"
alias py3env='source activate mypython3'
alias rg="grep -nri . -e"
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias md="mkdir"
alias c1="cd ~/Projects/CorrelationOne/"
alias sbp="source ~/.bash_profile"
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

export PATH="/Users/kevin/anaconda2/bin:$PATH"
export PATH=$HOME/.node_modules_global/bin:$PATH
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/julia
export PATH=$HOME/Projects/halite-2/hlt_client/hlt_client:$PATH
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="/usr/local/texlive/2018/bin/platform:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_192`

. /Users/kevin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
