{
  inputs,
  cell,
}:
{
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
