# Vi mode cursor shapes:
#   insert: blinking beam
#   normal: steady block

function zle-keymap-select {
  case "$KEYMAP" in
    vicmd)
      printf '\e[2 q'
      ;;
    viins|main)
      printf '\e[5 q'
      ;;
  esac
}

function zle-line-init {
  zle-keymap-select
}

function zle-line-finish {
  printf '\e[0 q'
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
