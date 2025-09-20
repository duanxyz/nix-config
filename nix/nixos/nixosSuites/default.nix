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
}
