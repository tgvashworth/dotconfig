SCRIPT_DIR="$(dirname "$0")"
[[ -f $SCRIPT_DIR/secrets.zsh ]] &&  source $SCRIPT_DIR/secrets.zsh
[[ -f $SCRIPT_DIR/../work/buld/scripts/fns.sh ]] &&  source $SCRIPT_DIR/../work/buld/scripts/fns.sh
[[ -f $HOME/.cargo/env ]] &&  source $HOME/.cargo/env

# How do I make local npm .bin targets available on my path?
PATH="./node_modules/.bin:$PATH"

# How do I get completion for gloud?
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

alias commit="git rev-parse ${1:=head}"
function cmt() {
    git add -p && git com "$(read -e)"
}
function af() {
    PWD=$(pwd)
    DIR="${2:=$PWD}"
    NAME=$1
    find $DIR -name "$NAME"
}

__git_files () {
    _wanted files expl 'local files' _files  }

function greset() {
    git status --porcelain | grep -v '??' | awk '{ print $2 }' | xargs -I % sh -c 'git ch head -- "%" || trash "%";'
}

