{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSUserEnv {
        name = "fhs-shell";
        targetPkgs = pkgs: [pkgs.libgcc];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ fhs ];
      };
    }
}

