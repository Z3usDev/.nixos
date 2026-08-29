{ ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      config = "sudo nano /etc/nixos/configuration.nix";
      home = "sudo nano /etc/nixos/home.nix";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#yokai";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [];
  };
}
