# zoxide/env.nu

let zoxide_init = ($nu.data-dir | path join "generated/zoxide.nu")
mkdir ($zoxide_init | path dirname)
zoxide init nushell | save -f $zoxide_init
