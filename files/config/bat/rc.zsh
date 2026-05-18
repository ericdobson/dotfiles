batmd() {
  fold -sw 80 -- "$1" | command bat -l markdown
}
