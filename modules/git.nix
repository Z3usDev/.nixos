{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    gh
  ];

  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";

      user = {
        name = "Lukas Schnellmann";
        email = "lukasschnellmann@gmail.com";
      };
    };
  };
}
