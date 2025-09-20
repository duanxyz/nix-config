{
  inputs,
  cell,
}:
let
  mkBee = (import (inputs.self + "/lib/mkBee.nix")) { inherit inputs; };
  bee = mkBee {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
    extraAttrs = {
      home = inputs.home-manager;
    };
  };

  home = {
    username = "duan";
    homeDirectory = "/home/duan";
    stateVersion = "25.05";
  };
in
{
  semar = {
    inherit bee home;
    programs.home-manager.enable = true;
    imports = with cell.homeSuites; [
      common
      terminal
      desktop
      dev
    ];
  };
}
