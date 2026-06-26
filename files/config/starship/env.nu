# starship/env.nu

let starship_init = ($nu.data-dir | path join "generated/starship.nu")
mkdir ($starship_init | path dirname)
starship init nu | save -f $starship_init
