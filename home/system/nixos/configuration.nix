# your system config is here~
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  systemd.network.enable = true;

  networking.interfaces.enp4s0.useDHCP = true;

  # Configure network proxy if necessary
  networking.proxy.httpProxy = "http://127.0.0.1:10809";
  networking.proxy.httpsProxy = "http://127.0.0.1:10809";
  networking.proxy.noProxy =
    "mirrors.tuna.tsinghua.edu.cn,cache.nixos.org,127.0.0.1,localhost,internal.domain";

  # set cache
  nix.binaryCaches =
    [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"];
  #nix.binaryCaches = [ "https://cache.nixos.org" ];

  # config zsh
  programs.zsh.enable = true;
  users.extraUsers.thief = { shell = pkgs.zsh; };
  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "ys";
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "zh_CN/GB2312"
      "zh_CN.GBK/GBK"
      "zh_CN.GB18030/GB18030"
    ];
    extraLocaleSettings = {
      #LC_CTYPE="zh_CN.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  i18n.inputMethod = {
    enabled = "fcitx";
    fcitx.engines = with pkgs.fcitx-engines; [ cloudpinyin rime ];
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
  boot.loader.grub.configurationLimit = 4;
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # developer tool
    vim
    emacs26
    llvm_10
    clang_10
    clang-tools
    cmake
    ripgrep # grep tool

    # tool
    google-chrome
    wget
    git
    tig
    usbutils
    pciutils
    lsof
    ninja
	  gnumake
    python37
    python27
    binutils  # tools like ar
    pkg-config
    lld
    tree # tree directory viewer
    nnn  # file explorer
    
    kitty # one cute terminal

    nixfmt # nix format tool

    sshpass # ssh without password input
    ffmpeg # image tool

    ncdu # file statics
    meld # directory compare
    ack # beyond
    fasd # jump directory
    tmux # terminal manager
    connect # proxy for network
    unzip
    # ark # extractor tool
    irccloud # irc client
    netease-cloud-music # music
    latte-dock # kde decorator
    jumpapp # jump to app window
    evince # pdf reader
    
    direnv # environment by direcotry
    glfw3 # invoke opengl
    mplayer # video player
  ];

  # enable v2ray
  services.v2ray.enable = true;
  services.v2ray.configFile = "/etc/v2ray/config.json";

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

  # enable opengl
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.thief = {
    isNormalUser = true;
    extraGroups = [ "audio" "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "20.03";
}
