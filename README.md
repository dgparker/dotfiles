# Dotfiles

Personal macOS and Parrot OS dotfiles managed with Nix, nix-darwin, Home
Manager, and nix-homebrew.

The macOS host configuration is `pooter`. Parrot OS uses a standalone Home
Manager configuration because it is a Debian-based Linux distribution rather
than NixOS.

## What This Manages

- macOS system defaults through nix-darwin
- Homebrew taps, formulae, casks, and services through the nix-darwin Homebrew module
- Shared user packages, shell setup, prompt setup, and config symlinks through Home Manager
- Native `x86_64-linux` and `aarch64-linux` Home Manager configurations for Parrot OS
- App configuration under `home/.config`
- Shared agent instructions for Claude, Codex, and OpenCode

## Layout

```text
.
+-- flake.nix              # Flake inputs and darwinConfigurations.pooter
+-- flake.lock             # Locked dependency revisions
+-- configuration.nix      # nix-darwin system and Homebrew config
+-- home.nix               # Shared Home Manager user config
+-- parrot.nix             # Parrot OS user and home settings
+-- build.sh               # Applies the correct config for macOS or Linux
`-- home/
    +-- AGENTS.md          # Shared agent instructions
    `-- .config/           # App configs symlinked into ~/.config
```

## Apply

Run:

```bash
./build.sh
```

The script links this checkout to `~/.dotfiles`, detects the host OS, and
applies the matching configuration.

On macOS it runs:

```bash
sudo darwin-rebuild switch --flake ~/.dotfiles#pooter
```

On Parrot OS it runs the architecture-matched Home Manager activation:

```bash
nix run ~/.dotfiles#parrot
```

## First-Time Parrot OS Setup

Install Nix in multi-user mode, then open a new shell:

```bash
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install \
  | sh -s -- --daemon
```

Clone this repository and apply it:

```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
./build.sh
```

The Parrot configuration expects the account name `parrot` and home directory
`/home/parrot`. It manages the user environment only. Parrot OS itself, its APT
packages, kernel, desktop, and security-tool metapackages remain managed by the
operating system.

After the first activation, `build.sh` checks the login shell used by SSH. If
the account does not already use Zsh, it registers the Nix-managed Zsh in
`/etc/shells` and selects it with `chsh`. This requires `sudo` on the first run;
later activations skip the change. The new shell is used by the next SSH
session.

## Update Flake Inputs

Update pinned inputs with:

```bash
nix flake update
./build.sh
```

## Homebrew

Homebrew is managed from `configuration.nix` on macOS only.

Current behavior:

- `onActivation.cleanup = "zap"` removes Homebrew packages that are not declared
- `onActivation.autoUpdate = true` updates Homebrew during activation
- `FelixKratz/formulae` is tapped and trusted
- `borders` is installed and started as a Homebrew service

To add a formula, add it to `homebrew.brews`. To add a cask, add it to
`homebrew.casks`.

## Config Symlinks

Home Manager creates out-of-store symlinks from the repo into the home
directory. For example:

```nix
home.file.".config/ghostty".source =
  config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/ghostty";
```

This keeps app config files editable in the repo while still allowing Home
Manager to own the destination paths.
