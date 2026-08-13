{ pkgs, ... }:

{
  home.username = "parrot";
  home.homeDirectory = "/home/parrot";

  # Packages needed only on Parrot OS. This list is merged with the shared
  # home.packages list in home.nix.
  home.packages = with pkgs; [
    go
    uv
  ];

  targets.genericLinux.enable = true;
}
