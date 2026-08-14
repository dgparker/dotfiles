{ pkgs, ... }:

{
  home.username = "parrot";
  home.homeDirectory = "/home/parrot";
  home.sessionPath = [
    "/usr/local/sbin"
    "/usr/sbin"
    "/sbin"
  ];

  # Packages needed only on Parrot OS. This list is merged with the shared
  # home.packages list in home.nix.
  home.packages = with pkgs; [
    go
    uv
  ];

  targets.genericLinux.enable = true;
}
