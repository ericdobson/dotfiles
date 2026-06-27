# nushell/env.nu
#
# See https://www.nushell.sh/book/configuration.html

# app-specific environment files
const config_dir = ($nu.default-config-dir | path join "../")

source ($config_dir | path join "fzf/env.nu")
source ($config_dir | path join "starship/env.nu")
source ($config_dir | path join "zoxide/env.nu")
