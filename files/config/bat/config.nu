# bat/config.nu

def --wrapped bat [...args] {
  if ($args | length) == 1 {
    let file = ($args | first | into string)
    let ext = ($file | path parse | get extension)

    if $ext in [md markdown] {
      ^fold -sw 80 -- $file | ^bat -l markdown
      return
    }
  }

  ^bat ...$args
}
