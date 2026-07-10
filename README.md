# Dotfiles

Personal macOS dotfiles managed with Nix, nix-darwin, Home Manager, and
nix-homebrew.

The main host configuration is `pooter`, defined in `flake.nix`.

## What This Manages

- macOS system defaults through nix-darwin
- Homebrew taps, formulae, casks, and services through the nix-darwin Homebrew module
- User packages, shell setup, prompt setup, and config symlinks through Home Manager
- App configuration under `home/.config`
- Shared agent instructions for Claude, Codex, and OpenCode

## Layout

```text
.
+-- flake.nix              # Flake inputs and darwinConfigurations.pooter
+-- flake.lock             # Locked dependency revisions
+-- configuration.nix      # nix-darwin system and Homebrew config
+-- home.nix               # Home Manager user config
+-- build.sh               # Applies the local flake with darwin-rebuild
`-- home/
    +-- AGENTS.md          # Shared agent instructions
    `-- .config/           # App configs symlinked into ~/.config
```

## Apply

Run:

```bash
./build.sh
```

The script links this checkout to `~/.dotfiles` and applies:

```bash
sudo darwin-rebuild switch --flake ~/.dotfiles#pooter
```

## Update Flake Inputs

Update pinned inputs with:

```bash
nix flake update
./build.sh
```

## Homebrew

Homebrew is managed from `configuration.nix`.

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

