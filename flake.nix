{
  description = "devShell for haddock";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs }:

    let
      inherit (nixpkgs.lib) genAttrs systems;

      supportedSystems =
        if builtins.hasAttr "currentSystem" builtins
        then [ builtins.currentSystem ]
        else systems.flakeExposed;

      perSystem = nixpkgs.lib.genAttrs supportedSystems;

      pkgsFor = (system: nixpkgs.legacyPackages.${system});

    in

    {
      devShells = perSystem (system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.haskell.compiler.ghc945
              pkgs.haskell.packages.ghc945.cabal-install
            ];

          };

        });

    };
}
