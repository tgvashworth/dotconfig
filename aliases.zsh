alias so="cd ~/work/source"
alias land="git ch $1 && arc land"
alias commit="git rev-parse ${1:=head}"
function cmt() {
    git add -p && git com "$(read -e)"
}
function service() {
    curl "https://api.twitter.com$1" -H 'X-Routing-Query: 1'
}
