{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    rofi
    hyprpaper
    dunst
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";

      monitor = [
        ",preferred,auto,1"
      ];

      input = {
        kb_layout = "ch";
        touchpad = {
          natural_scroll = true;
        };
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      bind = [
        "$mainMod, S, exec, rofi -show drun -show-icons"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
