{ pkgs, ... }: {
    programs = {
        wireshark.enable = true;
        # minipro.enable = true;
    };
    environment.systemPackages = with pkgs; [
        # Network
        nmap
        tcpdump
        caido
        wireshark
        # masscan
        # dig
        # dnschef

        # Discovery
        wordlists
        feroxbuster
        ffuf

        # Passwords
        john
        hashcat
        hashcat-utils
    
        # Reverse engineering
        # cutter
        # frida-tools

        # Firmware
        binwalk

        # Finding secrets
        # trufflehog

        # httpx
        # gowitness
        # mitmproxy
        # cewl
        # cantoolz
        # esptool
        # aircrack-ng
        # massdns (sanicdns is an alternative, not yet packaged for nix)
    ];
    environment.sessionVariables.WIRESHARK_PLUGIN_DIR = "$HOME/.local/lib/wireshark/plugins/";
    # Make hosts file writeable (by root)
    environment.etc.hosts.mode = "0644";
}
