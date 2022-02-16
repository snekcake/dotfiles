{ config, pkgs, ... }:

let
  prime-run = pkgs.writeShellScriptBin "prime-run" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "snow"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno2.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  # Select internationalisation properties.
  console = {
    font = "cyr-sun16";
    keyMap = "ru";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the DM and WM/DE.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.awesome.enable = true;

  # Making hybrid graphics work.
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
  hardware.pulseaudio.support32Bit = true;
  

  # Configure keymap in X11
  services.xserver.layout = "us,ru";
  services.xserver.xkbOptions = "grp:shift_toggle";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable the ACPI daemon.
  services.acpid.enable = true;

  # Enable the Flatpak daemon.
  # services.flatpak.enable = true;

  # Enable the SSH server.
  # services.sshd.enable = true;

  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.serp = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };
  users.users.labrat = {
    isNormalUser = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # alacritty
    cargo
    chromium
    # discord
    # dmenu
    # emacs
    feh
    firefox
    flatpak
    fzf
    gcc
    gdb
    git
    glibc
    # inkscape
    kitty
    libreoffice
    # lxappearance
    minecraft
    neovim
    nodejs
    openjdk
    # pciutils
    pcmanfm
    picom
    # polybar
    prime-run
    python3
    # ranger
    # rofi
    scrot
    # skype
    steam
    # sxhkd
    # teams
    # tor-browser-bundle-bin
    udisks
    unzip
    # vlc
    wget
    zathura
    zip
  ];
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;

  system.stateVersion = "21.05"; # Leave it.

}

