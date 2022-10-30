{
  description = "Personal website";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs @ { self
    , nixpkgs
    , flake-utils
    ,
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      # system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
      };
      overlay = (final: prev: {
        site = prev.callPackage ./website { };
      });

    in
    rec {
      inherit (overlay);
      formatter = pkgs.nixpkgs-fmt;

      defaultPackage = pkgs.site;
      # devShells = pkgs.mkShell {
        # buildInputs = with pkgs; [
          # zola
        # ];
      # };

    });
}
