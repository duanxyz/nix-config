{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.commit-mono
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "CommitMono Nerd Font"
    "JetBrainsMono Nerd Font"
  ];
}
