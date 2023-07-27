{ inputs, ... }: {
    imports = [
        ./alacritty
        ./git
        ./nvim
        ./zsh
        ./display
    ];
    home.username = "wouter";
    home.homeDirectory = "/home/wouter";
    home.stateVersion = "23.05";
    home.packages = [];
    programs.home-manager.enable = true;
}