{ pkgs, lib, ... }: {
    imports = [
        ./efi.nix
        ./env.nix
        ./packages.nix
        ./printing.nix
        ./opensnitch.nix
        ./syncthing.nix
    ];
    system.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];
    time.timeZone = "Europe/Amsterdam";
    i18n.defaultLocale = "en_US.UTF-8";
    # Auto cleanup garbage
    nix.gc.automatic = true;
    nix.gc.dates = "weekly";
    nix.gc.options = "--delete-older-than 30d";
    networking.networkmanager.enable = true;
    # Fix for wait-online daemon thing, temporary
    systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
    systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

    networking.nftables.enable = true; 
    services.printing.enable = true;
    services.openssh.enable = true;
    security.pam.services.swaylock = {};
    security.sudo.enable = true;
    security.doas.enable = true;
    security.doas.extraRules = [{
        users = [ "wouter" ];
        keepEnv = true;
        persist = true;
    }];

    programs.zsh.enable = true;
    programs.zsh.setOptions = [
        "AUTO_CD"
        "COMPLETE_ALIASES"
    ];
    users.defaultUserShell = pkgs.zsh;
    users.users.wouter = {
        isNormalUser = true;
        extraGroups = [
            "docker"
            "wireshark"
            "libvirtd"
            "networkmanager"
        ];
    };
    security.rtkit.enable = true;
    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
        ];
    };
    services.xserver = {
        enable = true;
        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";
        videoDrivers = ["modesetting"];

        displayManager = {
            defaultSession = "hyprland";
            lightdm.enable = true;
            autoLogin.enable = true;
            autoLogin.user = "wouter";
        };
    };
    fonts.packages = with pkgs; [
        hack-font
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        line-awesome
    ];
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
    programs.hyprland.enable = true;
    programs.dconf.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.docker.enable = true;
}
