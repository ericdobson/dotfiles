# config.nu
#
# See https://www.nushell.sh/book/configuration.html

# hide opening display
$env.config.show_banner = false

# kitty shell integration
# everything else is true by default
$env.config.use_kitty_protocol = true

# highlight aliased external commands as such
$env.config.highlight_resolved_externals = true
