{ pkgs, ... }:
let
    screenshot = pkgs.writeShellScriptBin "screenshot" ''
OPTIONS="copy\nsave"
CHOICE=$(echo -e $OPTIONS | wofi -d) || exit 0
case $CHOICE in
    copy) grimshot copy area ;;
    save)
        FILENAME=$(grimshot save area)
        mogrify -format webp $FILENAME
        rm $FILENAME ;;
esac
    '';
in {
    environment.systemPackages = with pkgs; [
        # Custom packages
        screenshot

        # Required
        alacritty
        networkmanagerapplet
        flavours
        wofi
        syncthing
        dunst
        bspwm
        qt6.qtwayland
        libsForQt5.qt5.qtwayland
        libsForQt5.qtstyleplugins

        wl-clipboard
        wl-clip-persist
        sway-contrib.grimshot
        hyprpaper
        hyprpicker
        libnotify
        swayidle
        swaylock-effects
        gnupg
        pavucontrol
        pcmanfm
        imv
        inetutils
        handlr
        teams-for-linux
        ledger-live-desktop

        # Command line
        ripgrep
        tree
        psmisc
        wget
        unzip
        unrar
        ffmpeg
        imagemagick
        just

        # Dev tools
        python3Full
        python311Packages.jedi-language-server
        rustup
        clippy
        rustfmt
        cargo
        cargo-generate
        cargo-watch
        gcc
        git
        nodejs
        docker
        docker-compose
        nil
        elixir

        # Programs
        virt-manager
        transmission-gtk
        spotify
        firefox
        signal-desktop
        obsidian
        keepassxc
        krita
        gimp
        vlc
        discord

        # VPN
        openvpn
    ];
}
