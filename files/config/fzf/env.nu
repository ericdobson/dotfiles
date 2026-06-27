# fzf/env.nu

let fzf_init = ($nu.data-dir | path join "generated/fzf.nu")
mkdir ($fzf_init | path dirname)
fzf --nushell | save -f $fzf_init
