{ inputs }:
{
  system ? "x86_64-linux",
  overlays ? [ ],
  extraAttrs ? { },
}:
let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = overlays;
  };
in
{
  inherit system pkgs;
}
// extraAttrs
