{ pkgs, ... }: {
    users.users.wouter = {
        isNormalUser = true;
        extraGroups = [
            "docker"
            "wireshark"
            "libvirtd"
            "networkmanager"
        ];
        shell = pkgs.zsh;
    };
}
