{ lib, ... }: {
    networking = {
        networkmanager.enable = true;
        # nameservers = [ "9.9.9.9" ];      # Quad9
        nameservers = [ "194.242.2.6" ];     # Mullvad
    };
    systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
    systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
}
