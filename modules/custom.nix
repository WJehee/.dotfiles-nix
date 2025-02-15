{ pkgs, ... }:
let
    ex = pkgs.writeShellScriptBin "ex" ''
        if [ -n $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   unzstd $1    ;;
            *.xz)        unxz $1      ;;
            *)           echo "'$1' cannot be extracted via ex" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
    '';
    flake-template = pkgs.writeShellScriptBin "flake-template" ''
        if [ -n $1 ] ; then
            nix flake init -t "github:wjehee/.dotfiles-nix#$1"
        else
            echo "must provide an argument"
        fi
    '';
in {
    environment.systemPackages = [
        ex
        flake-template
    ];
}
