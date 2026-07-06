# config.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# ./autoload contents:
#   - general aliases

# hide opening display
$env.config.show_banner = false

# prompt
$env.config.edit_mode = 'vi'
# $env.PROMPT_INDICATOR_VI_INSERT = $"(ansi green_bold)❯(ansi reset) "
# $env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi green_bold)❮(ansi reset) "

# kitty shell integration
# everything else is true by default
$env.config.use_kitty_protocol = true

# highlight aliased external commands as such
$env.config.highlight_resolved_externals = true

# history
let history_dir = ($env.XDG_STATE_HOME | path join nushell)
mkdir $history_dir

$env.config.history = {
  path: $history_dir
  max_size: 10_000
  file_format: sqlite
  isolation: false
}

# app-specific config files
const config_dir = ($nu.default-config-dir | path join "../")

source ($config_dir | path join aws config.nu)
source ($config_dir | path join bat config.nu)
source ($config_dir | path join codex config.nu)
source ($config_dir | path join fzf config.nu)
source ($config_dir | path join git config.nu)
source ($config_dir | path join homebrew config.nu)
source ($config_dir | path join lazygit config.nu)
source ($config_dir | path join op config.nu)
source ($config_dir | path join starship config.nu)
source ($config_dir | path join tinted-theming tinty config.nu)
source ($config_dir | path join yazi config.nu)
source ($config_dir | path join zoxide config.nu)
