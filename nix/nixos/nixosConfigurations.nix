{
  inputs,
  cell,
}:
let
  bee = {
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [
      ];
    };
  };
in
inputs.hive.findLoad {
  inherit cell;
  inputs = inputs // {
    inherit bee;
  };
  block = ./hosts;
}
