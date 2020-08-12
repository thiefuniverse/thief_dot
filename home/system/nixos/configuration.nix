# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
    #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    #networking.networkmanager.enable = true;
    systemd.network.enable = true;

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    #networking.useDHCP = true;
    networking.interfaces.enp4s0.useDHCP = true;

    # Configure network proxy if necessary
    networking.proxy.httpProxy = "http://127.0.0.1:10809";
    networking.proxy.httpsProxy = "http://127.0.0.1:10809";
    networking.proxy.noProxy = "mirrors.tuna.tsinghua.edu.cn,cache.nixos.org,127.0.0.1,localhost,internal.domain";

    # set cache
    nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    #nix.binaryCaches = [ "https://cache.nixos.org" ];

    # config zsh
    programs.zsh.enable = true;
    users.extraUsers.thief = {
      shell = pkgs.zsh;
    };
    programs.zsh.ohMyZsh = {
      enable = true;
      theme = "ys";
    };

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "zh_CN/GB2312"
      "zh_CN.GBK/GBK"
      "zh_CN.GB18030/GB18030"
      "zh_TW.UTF-8/UTF-8"
      "zh_TW/BIG5"
    ];
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
    i18n.inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [cloudpinyin rime ];
    };

    # set fonts
    fonts.fonts = with pkgs; [
      source-code-pro
      oxygenfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts
      dina-font
      proggyfonts
      wqy_microhei
      wqy_zenhei

    ];
    # config for grub options limit
    boot.loader.grub.configurationLimit = 6;
    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    nixpkgs.config.allowUnfree = true;
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [

      # developer tool
      vim emacs26 llvm_10 clang_10 cmake

      # tool
      google-chrome
      wget
      git
      tig
      usbutils
      pciutils
      lsof

      sshpass # ssh without password input
      ffmpeg # image tool

      ncdu # file statics
      meld # directory compare
      ack  #beyond
      fasd # jump directory
      tmux # terminal manager
      connect # proxy for network
      unzip
      # ark # extractor tool
      irccloud # irc client

      netease-cloud-music # music
      latte-dock # kde decorator
      jumpapp # jump to app window

    ];

    # enable v2ray
    services.v2ray.enable = true;
    services.v2ray.configFile = "/etc/v2ray/config.json";
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      #   pinentryFlavor = "gnome3";
      # };

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      networking.firewall.enable = false;

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound.
      sound.enable = true;
      #hardware.pulseaudio.enable = true;
      #boot.extraModprobeConfig = ''
      #  options snd slots=snd-hda-intel
      #'';
      hardware.pulseaudio = {
        enable = true;
        support32Bit = true;
        package = pkgs.pulseaudioFull;
      };
      # Enable the X11 windowing system.
      services.xserver.enable = true;
      services.xserver.layout = "us";
      services.xserver.xkbOptions = "eurosign:e";

      # Enable touchpad support.
      # services.xserver.libinput.enable = true;

      # Enable the KDE Desktop Environment.
      services.xserver.displayManager.sddm.enable = true;
      services.xserver.desktopManager.plasma5.enable = true;

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.thief = {
        isNormalUser = true;
        extraGroups = [ "audio" "wheel" ]; # Enable ‘sudo’ for the user.
      };

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "20.03"; # Did you read the comment?
}
