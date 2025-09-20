{ inputs }:
let
  scopedLoad =
    {
      src,
      loader ? inputs.haumea.lib.loaders.scoped,
      extraInputs ? { },
    }:
    inputs.haumea.lib.load {
      inherit src loader;
      inputs = extraInputs;
    };

  scopedValues = args: builtins.attrValues (scopedLoad args);
in
{
  inherit scopedLoad scopedValues;
}
