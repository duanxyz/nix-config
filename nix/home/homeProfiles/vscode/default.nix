{
  inputs,
  cell,
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.windsurf;
  };
}
