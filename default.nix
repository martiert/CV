{ pkgs, stdenv, ... }:

let
  inputs = with pkgs; [
    gnumake
    (texlive.combine {
      inherit (texlive)
        scheme-small
        dirtytalk
        blindtext
        titlesec
        lipsum
        textpos
        latexmk;
    })
  ];
in {
  shell = pkgs.mkShell {
    buildInputs = inputs ++ [ pkgs.git ];
  };

  package = stdenv.mkDerivation {
    name = "CV";
    version = "1.0";

    src = ./.;

    nativeBuildInputs = inputs;

    buildPhase = ''
      export HOME=\$\{PWD\}
      make
    '';
    installPhase = ''
      mkdir $out
      cp out/CV.pdf $out/CV.pdf
    '';
  };
}
