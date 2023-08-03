{
  description = "My CV";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = import nixpkgs { inherit system; };
        CV = pkgs.callPackages ./default.nix {};
      in rec {
        packages.default = CV.package;
        devShells.default = CV.shell;
      });
}
