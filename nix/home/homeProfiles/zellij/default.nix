{
  inputs,
  cell,
}:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
  };
}
