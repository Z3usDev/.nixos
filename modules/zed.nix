{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zed-editor
    nixd
    nixfmt
  ];

  programs.zed-editor = lib.mkForce {
    enable = true;

    extensions = [
      "catppuccin-icons"
      "dockerfile"
      "docker-compose"
      "github-theme"
      "nix"
      "toml"
      "typst"
    ];

    userSettings = {
      autosave.after_delay.milliseconds = 1000;

      icon_theme = "Catppuccin Latte";
      project_panel.dock = "left";
      edit_predictions.provider = "copilot";
      terminal.shell.program = "zsh";

      agent = {
        enabled = true;
        dock = "right";
        default_model = {
          effort = "medium";
          enable_thinking = true;
          provider = "google";
          model = "gemini-3.6-flash";
        };
      };

      theme = {
        mode = "system";
        light = "GitHub Light";
        dark = "GitHub Dark";
      };

      languages = {
        Nix = {
          format_on_save = "on";
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
      };

      lsp = {
        nixd = {
          binary = {
            path = lib.getExe pkgs.nixd;
          };

          initialization_options = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
      };
    };
  };
}
