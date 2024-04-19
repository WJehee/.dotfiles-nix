{
    description = "TEMPLATE";

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
                gleam
                erlang
            ];
            shellHook = ''
            '';
        };
    };
}
