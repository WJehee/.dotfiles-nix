{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        python312
        rustup
        cargo
        rust-analyzer
        clippy
        rustfmt
        gcc
        ripgrep
        signal-desktop
        obsidian
        flavours
        alacritty
        firefox
        wofi
        syncthing
        keepassxc
        dunst
        bspwm
        git
        docker
        qt6.qtwayland
        libsForQt5.qt5.qtwayland
        libsForQt5.qtstyleplugins
        wl-clipboard
        cliphist
        sway-contrib.grimshot
        hyprpaper
        libnotify
        swayidle
        swaylock-effects
        pavucontrol
        vlc
        psmisc
        networkmanagerapplet
        spotify
        wget
        unzip
        ffmpeg
        imagemagick
        gnupg
    ];
}
