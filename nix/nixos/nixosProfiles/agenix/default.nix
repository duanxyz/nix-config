{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
let
  secretDefs = import (inputs.self + "/secrets/secrets.nix");
  toSecret =
    name: value:
    let
      baseName = lib.strings.removeSuffix ".age" name;
      meta = if value ? deploy then value.deploy else { };
    in
    lib.nameValuePair baseName (
      {
        file = inputs.self + "/secrets/${name}";
      }
      // meta
    );
in
{
  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = lib.listToAttrs (lib.mapAttrsToList toSecret secretDefs);
}
