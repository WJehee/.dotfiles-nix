{ ... }: {
    imports = [
        ./alacritty.nix
        ./git.nix
        ./waybar.nix
        ./librewolf.nix
        ./firefox.nix
        ./hyprland.nix
        ./hyprlock.nix
        ./hypridle.nix
        ./dunst.nix
        ./nushell.nix
        ./zsh.nix
    ];
    home = {
        username = "wouter";
        homeDirectory = "/home/wouter";
        stateVersion = "24.11";
        packages = [];
    };
    programs.home-manager.enable = true;
}
