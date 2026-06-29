def --env df [] {
  z ($env.XDG_CONFIG_HOME | path expand)
  cl
}
