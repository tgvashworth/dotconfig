alias so="cd ~/work/source"
alias land="git ch $1 && arc land"
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
