# fzf/env.nu

let fzf_init = ($nu.data-dir | path join "generated/fzf.nu")
mkdir ($fzf_init | path dirname)

# fzf 0.74.5 still generates a legacy `spans` external completer. Nushell 0.116
# passes completion context by named input instead, with the command spans in
# `$place.command`.
fzf --nushell
  | str replace 'let fzf_wrapper_completer = {|spans|' 'let fzf_wrapper_completer = {|place|
    let spans = $place.command'
  | str replace 'do $previous_external_completer $spans' 'do $previous_external_completer $place'
  | save -f $fzf_init
