alias ..='cd ..'
alias lm="ls -l. | more"
alias py3env='source activate mypython3'

export PATH="/Users/kevin/anaconda2/bin:$PATH"
export PATH=$HOME/.node_modules_global/bin:$PATH
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/julia
export PATH=$HOME/Projects/halite-2/hlt_client/hlt_client:$PATH
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

