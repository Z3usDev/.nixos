{ pkgs, ... }:

{
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

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
      editor = "zed";
      prompt = "enabled";
    };

    extensions = with pkgs; [
      gh-dash
    ];
  };
}
