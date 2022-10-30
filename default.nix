{ pkgs, stdenv, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "9glenda-site";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ pkgs.hugo ];
  buildPhase = ''
    hugo --minify
    touch public/.nojekyll
  '';
  installPhase = ''
    cp -r public $out
  '';
}
