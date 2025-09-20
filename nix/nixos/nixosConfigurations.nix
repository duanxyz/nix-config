{
  inputs,
  cell,
}:
let
  mkBee = (import (inputs.self + "/lib/mkBee.nix")) { inherit inputs; };
  bee = mkBee {
    overlays = [
      inputs.agenix.overlays.default
    ];
  };
in
inputs.hive.findLoad {
  inherit cell;
  inputs = inputs // {
    inherit bee;
  };
  block = ./hosts;
}
