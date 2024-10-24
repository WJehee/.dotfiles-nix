{ pkgs, ... }: {
    imports = [
        ./nvim
        ./starship.nix
        ./zsh.nix
    ];
    virtualisation.libvirtd.enable = true;
    virtualisation.docker.enable = true;
    environment.systemPackages = with pkgs; [
        git
        docker
        docker-compose
        just
        nurl

        texlab
        nixd
        vscode-langservers-extracted
        htmx-lsp

        nushellPlugins.query
    ];
}
