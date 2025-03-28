{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # Desktop environment
        hyprpaper
        hyprpicker
        hyprpolkitagent
        hyprshot

        networkmanagerapplet
        blueman
        flavours
        wofi
        syncthing
        qt6.qtwayland
        libsForQt5.qt5.qtwayland
        libsForQt5.qtstyleplugins
        wl-clipboard
        grimblast
        swappy
        libnotify
        gnupg
        pavucontrol
        pcmanfm
        imv
        brightnessctl
        inetutils
        handlr
        playerctl
        
        # Command line utilities
        ripgrep
        tree
        psmisc
        wget
        zip
        unzip
        unrar
        ffmpeg
        imagemagick
        file
        usbutils
        fzf
        inotify-tools
        systemctl-tui
        nomino
        zenith
        dig
        jq

        # Applications
        transmission_4-gtk
        signal-desktop
        obsidian
        keepassxc
        krita
        gimp
        vlc
        discord
        openvpn
        # remmina
    ];
}
