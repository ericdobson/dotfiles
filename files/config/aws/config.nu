# aws/config.nu

def --wrapped aws [...args] {
  if (which ^aws | is-empty) {
    print --stderr "aws: command not found"
    return
  }

  let subcommand = ($args | first | default "" | into string)

  if $subcommand in ["" "sso" "configure" "help" "--help" "-h" "--version"] {
    ^aws ...$args
    return
  }

  let identity = (do { ^aws sts get-caller-identity } | complete)

  if $identity.exit_code != 0 {
    print --stderr "AWS identity check failed. Running: aws sso login"
    ^aws sso login
  }

  ^aws ...$args
}
