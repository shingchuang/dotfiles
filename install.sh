#!/usr/bin/env bash
# Coder dotfiles installer: `coder dotfiles <repo>` runs this script on workspace start.
set -euo pipefail

if command -v joe >/dev/null 2>&1; then
  echo "joe is already installed: $(command -v joe)"
  exit 0
fi

# Use sudo only when not already root.
SUDO=""
if [ "$(id -u)" -ne 0 ]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo "Not root and sudo is unavailable; cannot install joe." >&2
    exit 1
  fi
fi

echo "Installing joe..."
if command -v apt-get >/dev/null 2>&1; then
  $SUDO apt-get update -y
  DEBIAN_FRONTEND=noninteractive $SUDO apt-get install -y joe
elif command -v dnf >/dev/null 2>&1; then
  $SUDO dnf install -y joe
elif command -v yum >/dev/null 2>&1; then
  $SUDO yum install -y joe
elif command -v apk >/dev/null 2>&1; then
  $SUDO apk add --no-cache joe
elif command -v pacman >/dev/null 2>&1; then
  $SUDO pacman -Sy --noconfirm joe
elif command -v zypper >/dev/null 2>&1; then
  $SUDO zypper --non-interactive install joe
else
  echo "No supported package manager found; cannot install joe." >&2
  exit 1
fi

echo "joe installed: $(command -v joe)"
