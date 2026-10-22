# dotfiles

Dotfiles for [Coder](https://coder.com) workspaces.

On workspace start, Coder clones this repo and runs `install.sh`, which installs
the [joe](https://joe-editor.sourceforge.io/) text editor using whichever package
manager is available (apt, dnf, yum, apk, pacman, or zypper).

## Usage

In a workspace:

```sh
coder dotfiles -y https://github.com/shingchuang/dotfiles
```

Or set the repo URL as your dotfiles URL in the workspace template's
`dotfiles` module / parameter so it applies automatically on every start.
