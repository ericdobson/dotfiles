# homebrew/config.nu

alias bb = brew bundle

def bf [] {
  ^$env.VISUAL ($env.XDG_CONFIG_HOME | path join "homebrew/Brewfile")
}
