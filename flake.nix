{
  description = "Hushboard - Mute your microphone while typing";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hushboard = pkgs.callPackage ./packages/hushboard { inherit pkgs; };
      in
      rec {
        defaultPackage = hushboard;
        nixosModules.hushboard = import ./modules/hushboard { inherit hushboard; };
        apps.hushboard = flake-utils.lib.mkApp { drv = hushboard; };
        defaultApp = apps.hushboard;
      }
    );
}
