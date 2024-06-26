{
    description = "Python template";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        devShells.${system}.default = with pkgs; mkShell {
            buildInputs = [
                python311
                
            ] ++ (with python311Packages; [
                jedi-language-server
            ]);
            shellHook = ''
            '';
        };
    };
}
