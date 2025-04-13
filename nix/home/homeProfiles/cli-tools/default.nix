{
  inputs,
  cell,
}:

# home.packages = with pkgs; [
# fd
# ];

inputs.haumea.lib.load {
  src = ./.;
  loader = inputs.haumea.lib.loaders.scope;
}
