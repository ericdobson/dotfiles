# codex/config.nu

# (gui) launch alias
alias lc = ^launch_codex

# (cli) require codex home and run with environment variables
def --wrapped codex [...args] {
  if ($env.CODEX_HOME? | is-empty) {
    error make { msg: "CODEX_HOME must be set" }
  }

  let env_file = ($env.CODEX_HOME | path join codex.env)

  ^op run --no-masking --env-file $env_file -- codex ...$args
}
