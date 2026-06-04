# macOS

## Use Homebrew zsh as the Login Shell

First, install zsh using Homebrew and make sure the Homebrew zsh is the version
found in `$PATH`.

```zsh
echo $(which zsh) | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
```

Then log out of macOS and log back in.

Verify the setting in either of these ways:

1. Open System Settings > Users & Groups, right-click the username, select
   Advanced, and check Login Shell.
2. Run:

   ```zsh
   echo $SHELL
   ```
