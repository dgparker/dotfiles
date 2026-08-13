{
  config,
  lib,
  pkgs,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    tree-sitter
    ripgrep
    fd
    fzf
    jq
    lazygit
    neovim
    nerd-fonts.hack

    # Protocol Buffer and Buf tooling for contract-first API repositories.
    buf
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-connect-go
  ];
  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      export OPENCODE_ENABLE_EXA=1

      bindkey '^f' autosuggest-accept

      if [[ -r "$HOME/.zsh.local" ]]; then
        source "$HOME/.zsh.local"
      fi
    '';
    shellAliases = {
      ".." = "cd ..";
      add = "git add .";
      push = "git push";
      pull = "git pull";
      m = "git switch main";
      cc = "claude --dangerously-skip-permissions";
      co = "codex --yolo";
      oc = "opencode --auto";
      vim = "nvim";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };

  home.file = {
    ".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/ghostty";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
    ".config/herdr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr";
    ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.tmux.conf";
    ".claude/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.claude/settings.json";
    ".claude/CLAUDE.md".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
    ".codex/AGENTS.md".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
    ".config/opencode/opencode.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/opencode/opencode.json";
    ".config/opencode/AGENTS.md".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  }
  // lib.optionalAttrs pkgs.stdenv.isDarwin {
    ".config/aerospace".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/aerospace";
    ".config/borders/bordersrc".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/borders/bordersrc";
  };
}
