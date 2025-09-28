_: {
  projectRootFile = "flake.nix";
  programs = {
    nixfmt.enable = true;
    statix.enable = true;
    deadnix = {
      enable = true;
      no-lambda-pattern-names = true;
    };
  };
}
