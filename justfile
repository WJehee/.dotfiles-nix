alias r := rebuild
alias u := update

hostname := `hostname`

# Rebuild OS
rebuild:
    git add .
    doas nixos-rebuild switch --flake ".#{{hostname}}" &>rebuild.log || grep -C 2 --color error rebuild.log

# Update packages
update:
    nix flake update

