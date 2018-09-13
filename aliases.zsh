SCRIPT_DIR="$(dirname "$0")"
[[ -f $SCRIPT_DIR/secrets.zsh ]] &&  source $SCRIPT_DIR/secrets.zsh
[[ -f $HOME/.cargo/env ]] &&  source $HOME/.cargo/env

export S="~/work/source"

alias so="cd ~/work/source"
function land() {
    git ch $1 && \
    arc land
}
alias commit="git rev-parse ${1:=head}"
function cmt() {
    git add -p && git com "$(read -e)"
}
function service() {
    curl "https://api.twitter.com$1" -H 'X-Routing-Query: 1'
}
function zipkin() {
    $@ -H 'X-B3-Flags: 1' -i \
        | grep "x-transaction-id" \
        | cut -d' ' -f2 \
        | tr -d '\r' \
        | xargs -I {} open http://go/zipkin/{}
}
function workon() {
    NAME="$USER/$1"
    MASTER="master"
    BASE="${2:=$MASTER}"

    echo "Working on $NAME from $BASE"

    git ch $BASE
    [[ "$BASE" == "$MASTER" ]] && git pull

    (git ch $NAME || git nbr $NAME)
    git rebase $BASE
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

function whodis() {
    pbpaste | tr ',' '\n' | sed -E 's/^.*<(.*)@.*>/\1/' | awk '{$1=$1;print}' | xargs -n1 -I {} -- open "http://go/who/{}"
}
