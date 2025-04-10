{
  inputs,
  cell,
}:
let
  bee = {
    system = "x86_64-linux";
    home = inputs.home-manager;
    pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [ ];
    };
  };

  home = rec {
    username = "duan";
    homeDirectory = "/home/duan";
    stateVersion = "24.11";
  };
in
{
  semar = {
    inherit bee home;
    programs.home-manager.enable = true;
    imports = [ ];
  };
}
