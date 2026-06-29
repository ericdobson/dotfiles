# Push the current screen to scrollback, then return the cursor home.
def clear [] {
  1..((term size).rows) | each { print "" } | ignore
  print --no-newline (ansi --escape H)
}
