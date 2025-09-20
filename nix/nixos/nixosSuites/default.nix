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
  workstation = call ./workstation/default.nix;
  minimal = call ./minimal/default.nix;
  server = call ./server/default.nix;
}
