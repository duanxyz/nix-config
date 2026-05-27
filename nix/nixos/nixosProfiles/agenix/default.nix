{
  lib,
  inputs,
  ...
}:
let
  secretDefs = import (inputs.self + "/secrets/secrets.nix");
  toSecret =
    name: value:
    let
      baseName = lib.strings.removeSuffix ".age" name;
      meta = value.deploy or { };
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
  age.identityPaths = [ "/var/lib/key.txt" ];
}
