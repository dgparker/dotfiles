{
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "dylan";
  users.users.dylan = {
    home = "/Users/dylan";
  };

  home-manager.users.dylan = {
    home.username = "dylan";
    home.homeDirectory = "/Users/dylan";
  };

  system.stateVersion = 6;

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2; # fast key repeat
      InitialKeyRepeat = 15; # short delay before repeat
      _HIHideMenuBar = true; # auto-hide the menu bar
      AppleShowAllExtensions = true;
      "com.apple.swipescrolldirection" = false;
    };

    dock = {
      autohide = true;
      tilesize = 32;
      orientation = "left";
      show-recents = false;
    };

    finder.FXPreferredViewStyle = "Nlsv"; # list view by default
    finder.CreateDesktop = false; # clean desktop
    trackpad.Clicking = true; # tap to click
  };

  nix-homebrew = {
    enable = true;
    user = "dylan";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    # Temporary: brew 6.0.15 rejects the AeroSpace cask's must_succeed keyword.
    # Keep its declaration below so bundle cleanup preserves the installed app.
    # extraEnv reaches brew after sudo; remove once the pinned brew can parse it.
    onActivation.extraEnv.HOMEBREW_BUNDLE_CASK_SKIP = "aerospace";

    taps = [
      {
        name = "FelixKratz/formulae";
        trusted = true;
      }
      {
        name = "rjyo/moshi";
        trusted = true;
      }
    ];

    brews = [
      "tmux"
      "herdr"
      "kubernetes-cli"
      "k9s"
      "go"
      "opencode"
      "gh"
      "bufbuild/buf/buf"
      "mosh"
      "moshi-hook"
      "openvpn"
      "virtctl"
      {
        name = "borders";
        start_service = true;
      }
    ];

    casks = [
      "ghostty"
      "claude-code"
      "google-chrome"
      "chatgpt"
      "codex"
      "nikitabobko/tap/aerospace"
      "raycast"
      "arc"
      "discord"
      "spotify"
      "docker-desktop"
      "tigervnc"
      "firefox"
    ];
  };
}
