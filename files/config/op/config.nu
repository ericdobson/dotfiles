# op/config.nu

$env.OP_PLUGIN_ALIASES_SOURCED = "1"

def --wrapped gh [...args] {
  ^op plugin run -- gh ...$args
}
