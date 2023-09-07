{ config, ... }: {
    programs.waybar = {
	enable = true;
	settings = [{
	    layer = "top";
	    modules-left = ["hyprland/workspaces"];
	    modules-right = [
		"wireplumber"
		"network"
		"battery"
		"clock"
		"tray"
	    ];
	    battery = {
		format = "{capacity}% {icon}";
		format-icons = ["" "" "" "" ""];
	    };
	    clock.format-alt = "{:%a, %d. %b %H:%M}";
	    tray = {
		icon-size = 21;
		spacing = 10;
	    };
	}];
    };
}
