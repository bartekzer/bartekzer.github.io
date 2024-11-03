{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.pandoc
    pkgs.nodePackages_latest.tailwindcss
    pkgs.bun
  ];

  shellHook = ''
    chmod +x ./convert.sh
    chmod +x ./tw-watch.sh
  '';
}