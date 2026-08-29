{ inputs, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking.
  networking.hostName = "yokai"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_CH.UTF-8";

  # List services that you want to enable:
  services = {
    fwupd.enable = true;
    power-profiles-daemon.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  # Configure console keymap
  console.keyMap = "sg";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."lukas" = {
    isNormalUser = true;
    description = "Lukas Schnellmann";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.lukas = import ./home.nix;
    backupFileExtension = "backup";
  };

  programs = {
    zsh.enable = true;

    hyprland.enable = true;

    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      libsecret
      glib
    ];

    # Install firefox.
    firefox.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment = {
    # List packages installed in system profile.
    systemPackages = [ ];

    plasma6.excludePackages = [
      pkgs.kdePackages.kate
    ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
