{
  pkgs ? import ~/Projects/nix/utils/pkgs/21.05.nix {},
}:

let
  editor = import ~/Projects/nix/utils/tools/editor.nix { inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    editor
    git
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

  shell = pkgs.zsh;
}
