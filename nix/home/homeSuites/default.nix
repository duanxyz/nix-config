{
  inputs,
  cell,
}:
let
  call =
    path:
    import path {
      inherit inputs cell;
    };
in
{
  common = call ./common/default.nix;
  terminal = call ./terminal/default.nix;
  desktop = call ./desktop/default.nix;
  dev = call ./dev/default.nix;
}
